//
//  NameDaysDataSource.swift
//  Nameinar
//
//  Created by Dragomir Ivanov on 22.11.19.
//  Copyright © 2019 Swift FMI. All rights reserved.
//

import Foundation

//MARK: - Model
struct NameDay: Decodable {
    let date: String
    let title: String
    let names: [String]
}

final class NameDaysDataSource {
    //MARK: - Singleton
    static let shared = NameDaysDataSource()
    private init() { }
    
    //MARK: - Data
    let nameDays: [NameDay] = {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return [] }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode([NameDay].self, from: jsonData)
        } catch {
            return []
        }
    }()
}
