//
//  ToDoDataManager.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import Foundation

class ToDoDataManager: ObservableObject {
    static let TODO_DATA_LIST_KEY = "TODO_DATA_LIST_KEY"
    static let shared = ToDoDataManager()
    @Published var toDoList:[ToDoModel] = []
    
    func getDummyDate() -> [ToDoModel] {
        return [
            ToDoModel(keyDate: Date(), todo: "깃허브 커밋하기"),
            ToDoModel(keyDate: Date(), todo: "알고리즘 문제풀기")
        ]
    }
    
    func getToDoList() -> [ToDoModel] {
        if toDoList.isEmpty {
            return getDummyDate()
        }
        
        let returnToDoList:[ToDoModel] = toDoList
        return returnToDoList
    }
}
