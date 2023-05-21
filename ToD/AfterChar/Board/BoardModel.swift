//
//  BoardModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/18.
//

import Foundation

enum JobItem: String, CaseIterable, Codable {
//    var jobList : [String] = ["서버 / 백엔드", "프론트앤드", "모바일", "SW / 솔루션", "보안", "QA 엔지니어", "임베디드", "인공지능 / 머신러닝"]
    case server
    case frontEnd
    case moblie
    case sw
    case security
    case qa
    case imbeded
    case ai
    
    var displayJobName: String {
        switch self {
        case .server: return "서버 / 백엔드"
        case .frontEnd: return "프론트앤드"
        case .moblie: return "모바일"
        case .sw: return "SW / 솔루션"
        case .security: return "보안"
        case .qa: return "QA 엔지니어"
        case .imbeded: return "임베디드"
        case .ai: return "인공지능 / 머신러닝"
        }
    }

}

struct BoardModel: Codable, Hashable {
    var keyDate: Date
    
    func keyDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: keyDate)
    }
    
    var title: String
    var contents: String
    var job: JobItem
}
