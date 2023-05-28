//
//  CharacterModel.swift
//  ToD
//
//  Created by 문영균 on 2023/05/27.
//

import Foundation

enum characterCategory: String, CaseIterable, Codable {
    case none
    case server
    case frontEnd
    case moblie
    case sw
    case security
    case qa
    case embeded
    case ai
    
    var displayJobImageName: String {
        switch self {
        case .server: return "back"
        case .frontEnd: return "front"
        case .moblie: return "mobile"
        case .sw: return "swsolution"
        case .security: return "security"
        case .qa: return "bug"
        case .embeded: return "embedded"
        case .ai: return "ai"
        default: return "not selected"
        }
    }
    
    var displayJobName: String {
        switch self {
        case .server: return "서버/\n백엔드"
        case .frontEnd: return "프론트엔드"
        case .moblie: return "모바일\n"
        case .sw: return "SW/\n솔루션"
        case .security: return "보안\n"
        case .qa: return "QA엔지니어"
        case .embeded: return "임베디드\n"
        case .ai: return "인공지능/\n머신러닝"
        default: return "not selected"
        }
    }
}
