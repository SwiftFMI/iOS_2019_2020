# Упражнение №2 (17.10.2019):

1. Да се изгради модел за потребител;
2. Да се изгради мениджър, който ще има методи за вход и регистрация;
3. Да се направи имитация на комуникация със сървър, която да връща грешка за съществуващ потребител при регистрация и грешки за несъществуващ потребител при вход, както и грешка за грешни потребителско име и парола.

### Допълнение:

(4). Използвайте клоужъри за връщане на резултати от мениджъра, като обектът трябва да бъде от тип `Result`.

(5). Имитирайте комуникация със сървър, като забавите отговорът от методите.

# Решение:

```
import UIKit

/// Модел за потребител.
struct User {
    
    /// Потребителско име.
    let username: String
    
    /// Парола.
    let password: String
    
}

/// Мениджър, който се занимава с регистрацията на нови потребители и тяхното съхранение, както и вход на потребители.
/// Класът е маркиран като `final` за да забраним наследяването.
final class UserManager {
    
    /// Singleton константа за достъп до `UserManager`.
    static let shared = UserManager()
    
    /// Имитация на база данни от потребители.
    private var users = [User]()
    
    /// Забраняваме инициализацията на обекти от тип `UserManager. Това налага използването на константата `shared`.
    private init() { }
    
}

/// Разширение на `UserManager` съдържащо методите за вход и регистрация.
extension UserManager {
    
    /// Enum от тип `Error`, който ще бъде връщан като резултат от методите за вход и регистрация.
    enum UserError: String, Error {
        
        // Няма такъв потребител.
        case noSuchUser
        
        // Грешна парола.
        case wrongPassword
        
        // Потребителят вече съществува.
        case alreadyExists
    }
    
    /// Метод за вход приемащ потребителско име, парола и клоужър, който ще ни върне резултат.
    func logIn(username: String, password: String, completion: @escaping (Result<User, UserError>) -> Void) {
        // Проверяваме дали има съществуващ потребител, като потърсим дали подаденото потребителско име вече съществува в `users` масивът ни.
        if let user = users.first(where: { user in user.username == username }) {
            // Забавяме резултатът от метода с 2 секунди.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Проверяваме дали подадената парола съвпада и връщаме съответният резултат.
                if user.password != password {
                    completion(.failure(.wrongPassword))
                } else {
                    completion(.success(user))
                }
            }
        } else {
            // Забавяме резултатът от метода с 2 секунди.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Връщаме грешка за несъществуващ потребител.
                completion(.failure(.noSuchUser))
            }
        }
    }
    
    /// Метод за регистрация на потребител приемащ потребителско име, парола и клоужър, който ще ни върне резултат.
    func register(username: String, password: String, completion: @escaping (User?) -> Void) {
        // Проверяваме дали имаме потребител със същото потребителско име в `users` масива.
        if users.contains(where: {  user in user.username == username }) {
            // Забавяме резултатът от метода с 1 секунда.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // Връщаме празен обект. Вече има потребител с това потребителско име.
                completion(nil)
            }
        } else {
            // Няма такъв потребител в масива и можем да го създадем.
            let newUser = User(username: username, password: password)
            
            // Добавяме го в "базата данни".
            users.append(newUser)
            
            // Връщаме новосъздаденият потребител като резултат от метода.
            completion(newUser)
        }
    }
    
}

// MARK: - Извикване на методите:

UserManager.shared.register(
    username: "fmi",
    password: "password",
    completion: { print("Registered new user: \($0?.username ?? "none")") }
)

UserManager.shared.logIn(
    username: "fmi",
    password: "password",
    completion: {
        switch $0 {
        case .success(let user):
            print("Successfully logged in: \(user.username)")
        case .failure(let error):
            print(error)
        }
    }
)

```
