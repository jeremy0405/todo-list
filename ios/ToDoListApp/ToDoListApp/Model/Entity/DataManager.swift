//
//  DataManager.swift
//  ToDoListApp
//
//  Created by Jihee hwang on 2022/04/12.
//

import Foundation

class DataManager {
    static var iso8601Full: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
           formatter.calendar = Calendar(identifier: .iso8601)
           return formatter
    }()
    
    static func decode(data: Data) -> CardData?  {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(iso8601Full)
        return try? decoder.decode(CardData.self, from: data)
    }
    
    static func encode(data: CardData) -> Data?  {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(iso8601Full)
        encoder.outputFormatting = .prettyPrinted
        return try? encoder.encode(data)
    }
}
