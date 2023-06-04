//
//  ToDoModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import Foundation

enum Category: String, CaseIterable, Codable {
    case dev
    case tod
    
    var displayCategory: String {
        switch self {
        case .dev: return "목표 적기"
        case .tod: return "투디 퀘스트"
        }
    }
}


struct ToDoModel: Codable, Hashable {
    var id = UUID()
    var keyDate: Date
    func KeyDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: keyDate)
    }
    
    mutating func markAsComptete() {
        isComplete = true
    }
    
    var toDoType: Category
    var deadLine: Date?
    var todo: String
    var todoDetail: String
    var isComplete: Bool = false
}
