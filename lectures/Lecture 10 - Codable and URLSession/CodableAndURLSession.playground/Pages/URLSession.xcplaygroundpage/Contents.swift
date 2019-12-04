import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

//https://api.openweathermap.org/data/2.5/weather?q=Sofia,bg&units=metric&lang=bg&appid=7df485076cd86fd0dbab7e38b388e8dc

struct Weather: Decodable {
    private enum TopLevelCodingKeys: String, CodingKey {
        case weather, main
    }
    
    private enum WeatherCodingKeys: String, CodingKey {
        case icon, description
    }
    
    private enum MainCodingKeys: String, CodingKey {
        case temp, humidity
    }
    
    let conditions: String
    let imageName: String
    let temp: Float
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TopLevelCodingKeys.self)
        
        let mainNestedContainer = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        temp = try mainNestedContainer.decode(Float.self, forKey: .temp)
        
        var weatherNestedContainer = try container.nestedUnkeyedContainer(forKey: .weather)
        
        let weatherValueContainer = try weatherNestedContainer.nestedContainer(keyedBy: WeatherCodingKeys.self)
        
        conditions = try weatherValueContainer.decode(String.self, forKey: .description).capitalized
        imageName = try weatherValueContainer.decode(String.self, forKey: .icon)
    }
}

final class Networking {
    enum Error: Swift.Error {
        case serverError(Swift.Error)
        case emptyResponse
        case decoding(Swift.Error)
    }
    
    private init() { }

    static func getCurrentWeather(completion: @escaping (Result<Weather, Error>) -> ())  {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/data/2.5/weather"

        let cityParameter = URLQueryItem(name: "q", value: "Sofia,bg")
        components.queryItems = [
            cityParameter,
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "lang", value: "bg"),
            URLQueryItem(name: "appid", value: "7df485076cd86fd0dbab7e38b388e8dc")
        ]

        let url = components.url!

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completion(.failure(.serverError(error!)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.emptyResponse))
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                completion(.success(weather))
            } catch {
                print(error)
                completion(.failure(.decoding(error)))
            }
        }.resume()
    }
    
    static func getCurrentWeatherImage(name: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        URLSession.shared.dataTask(with: URL(string: "http://openweathermap.org/img/w/\(name).png")!) { (data, response, error) in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(.failure(.emptyResponse))
                return
            }
            
            completion(.success(image))
        }.resume()
    }
}



Networking.getCurrentWeather { (result) in
    switch result {
    case .success(let weather):
        print(weather)
        
        Networking.getCurrentWeatherImage(name: weather.imageName) { (result) in
            switch result {
            case .success(let image):
                let image = image
                print(image.size)
                PlaygroundPage.current.finishExecution()
            default:
                PlaygroundPage.current.finishExecution()
            }
        }
        
    default:
        print(result)
        PlaygroundPage.current.finishExecution()
    }
}
