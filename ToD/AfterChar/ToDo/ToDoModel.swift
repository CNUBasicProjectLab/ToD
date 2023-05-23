//
//  ToDoModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import Foundation

struct ToDoModel: Codable {
    var keyDate: Date
    
    func KeyDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: keyDate)
    }
    
    var deadLine: Date?
    
    var todo: String
}
