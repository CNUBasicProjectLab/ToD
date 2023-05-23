//
//  ToDoModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import Foundation

enum toDoItem: String, CaseIterable, Codable {
    case dev
    case normal
    case tod
    
    var displayToDoItemName: String {
        switch self {
        case .dev: return "개발"
        case .normal: return "일반"
        case .tod: return "투디 퀘스트"
        }
    }
}


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