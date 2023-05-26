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
    
    init() {
        if let data = UserDefaults.standard.value(forKey: ToDoDataManager.TODO_DATA_LIST_KEY) as? Data {
            let accountList = try? PropertyListDecoder().decode([ToDoModel].self, from: data)
            if let list = accountList {
                toDoList = list
            }
        }
    }
    
    func getDummyDate() -> [ToDoModel] {
        return [
            ToDoModel(keyDate: Date(), toDoType: .dev, todo: "깃허브 커밋하기", todoDetail: "알고리즘 문제풀고 커밋하기", isComplete: false),
            ToDoModel(keyDate: Date(), toDoType: .dev, todo: "알고리즘 문제풀기", todoDetail: "골드 5 이상 문제 풀기", isComplete: false),
            ToDoModel(keyDate: Date(), toDoType: .normal, todo: "일기 쓰기", todoDetail: "자기전에 쓰세용", isComplete: false),
            ToDoModel(keyDate: Date(), toDoType: .tod, todo: "투디 퀘스트 no.1", todoDetail: "투디 퀘스트 디테일", isComplete: false)
        ]
    }
    
    func getToDoList() -> [ToDoModel] {
        if toDoList.isEmpty {
            return getDummyDate()
        }
        
        let returnToDoList:[ToDoModel] = toDoList
        return returnToDoList
    }
    
    func add(ToDoModel acData:ToDoModel?) -> Bool {
        if let data = acData {
            toDoList.insert(data, at: 0)
            
            UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey: ToDoDataManager.TODO_DATA_LIST_KEY)
            return UserDefaults.standard.synchronize()
        }
        return false
    }
    
    func updateToDo() {
        let list = toDoList
        toDoList = list
    }
    
    func updateToDoItem(_ todo: ToDoModel) {
        guard let index = toDoList.firstIndex(where: {$0.id == todo.id}) else {
            return
        }
        toDoList[index] = todo
        saveToDoList()
    }
    
    func saveToDoList() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey: ToDoDataManager.TODO_DATA_LIST_KEY)
        UserDefaults.standard.synchronize()
    }
    
}
