//
//  BoardManager.swift
//  ToD
//
//  Created by 문영균 on 2023/05/18.
//

import Foundation

class BoardDataManager: ObservableObject {
    static let BOARD_DATA_LIST_KEY = "BOARD_DATA_LIST_KEY"
    static let shared = BoardDataManager()
    
    @Published var dataList: [BoardModel] = []
    
    init() {
        if let data = UserDefaults.standard.value(forKey: BoardDataManager.BOARD_DATA_LIST_KEY) as? Data {
            let accountList = try? PropertyListDecoder().decode([BoardModel].self, from: data)
            if let list = accountList {
                dataList = list
            }
        }
        
    }
    
    func getDummyData() -> [BoardModel] {
        return [
            BoardModel(keyDate: Date(), title: "Swift 알려주세요", contents: "UIKit이 너무 어려워용. UserDefault도 너무 어려워서 힘드네요 흑흑흑흑", job: .moblie),
            BoardModel(keyDate: Date(), title: "타입스크립트 알려주세요", contents: "너무 어렵당 흑흑", job: .frontEnd)
        ]
    }
    
//    게시글 리스트가 비어있으면 더미데이터를 보여줌
    func getList() -> [BoardModel] {
        if dataList.isEmpty {
            return getDummyData()
        }
        
        let returnList:[BoardModel] = dataList
        return returnList
    }
    
    
    func add(BoardModel acData:BoardModel?) -> Bool {
        if let data = acData {
            dataList.insert(data, at: 0)
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(dataList), forKey: BoardDataManager.BOARD_DATA_LIST_KEY)
            return UserDefaults.standard.synchronize()
        }
        return false
    }
    
}
