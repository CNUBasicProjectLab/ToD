//
//  ToDoModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import Foundation

enum Category: String, CaseIterable, Codable {
    case dev
    case normal
    case tod
    
    var displayCategory: String {
        switch self {
        case .dev: return "개발"
        case .normal: return "일반"
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
    
    var toDoType: Category
    var deadLine: Date?
    var todo: String
    var todoDetail: String
    var isComplete: Bool
}
