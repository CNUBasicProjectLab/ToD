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
    
    func getDummyData() -> [ToDoModel] {
        return [
            ToDoModel(keyDate: Date(), toDoType: .dev, todo: "깃허브 커밋하기", todoDetail: "알고리즘 문제풀고 커밋하기"),
            ToDoModel(keyDate: Date(), toDoType: .dev, todo: "알고리즘 문제풀기", todoDetail: "골드 5 이상 문제 풀기"),
            ToDoModel(keyDate: Date(), toDoType: .tod, todo: "투디 퀘스트 no.1", todoDetail: "투디 퀘스트 디테일")
        ]
    }
    
    func commonQuest() -> [ToDoModel] {
        return [
            ToDoModel(keyDate: Date(), toDoType: .tod, todo: "백준 온라인 저지 문제 하루에 1개 해결하기", todoDetail: "백준 온라인 저지 문제 하루에 1개 해결하기 (하)"),
            ToDoModel(keyDate: Date(), toDoType: .tod, todo: "개발 세미나 참여하기", todoDetail: "개발 세미나 참여하기 (중)"),
            ToDoModel(keyDate: Date(), toDoType: .tod, todo: "깃허브 오픈소스 프로젝트 기여", todoDetail: "깃허브 오픈소스 프로젝트 기여 (상)")
        ]
    }
    
    func getToDoList(jobCategory myJob: String) -> [ToDoModel] {
        if toDoList.isEmpty {
//            return getDummyData()
            self.toDoList = getTodData(jobCategory: myJob)
            updateToDo()
            return toDoList
        }
        
        let returnToDoList:[ToDoModel] = toDoList
        return returnToDoList
    }
    
    func getTodData(jobCategory job: String) -> [ToDoModel] {
        var todQuenst: [ToDoModel] = commonQuest()
        switch job {
        case characterCategory.server.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "HTML, CSS, JavaScript를 활용하여 간단한 웹 페이지 개발하기", todoDetail: "HTML, CSS, JavaScript를 활용하여 간단한 웹 페이지 개발하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "자바와 데이터베이스를 연동하여 데이터베이스 프로그램 개발하기", todoDetail: "자바와 데이터베이스를 연동하여 데이터베이스 프로그램 개발하기 (상)"))
        case characterCategory.frontEnd.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "HTML과 CSS를 사용하여 간단한 정적 웹 페이지를 구성하기", todoDetail: "HTML과 CSS를 사용하여 간단한 정적 웹 페이지를 구성하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "선택한 프론트엔드 프레임워크를 사용하여 실제 프로젝트 개발하기", todoDetail: "선택한 프론트엔드 프레임워크를 사용하여 실제 프로젝트 개발하기 (상)"))
        case characterCategory.moblie.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "Figma에서 UI 디자인해보기", todoDetail: "Figma에서 UI 디자인해보기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "파이어베이스 기능을 통해 푸쉬알림 구현해보기", todoDetail: "파이어베이스 기능을 통해 푸쉬알림 구현해보기 (상)"))
        case characterCategory.sw.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "UML을 이용한 설계 다이어그램 작성하기", todoDetail: "UML을 이용한 설계 다이어그램 작성하기"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "데이터베이스 연동 프로그램 작성하기", todoDetail: "데이터베이스 연동 프로그램 작성하기 (상)"))
        case characterCategory.security.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "대칭키와 공개키 암호화 기법, 해시 함수 학습하고 구현하기", todoDetail: "대칭키와 공개키 암호화 기법, 해시 함수 학습하고 구현하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "보안 개발 프레임워크를 활용하여 안전한 코드 개발하기", todoDetail: "보안 개발 프레임워크를 활용하여 안전한 코드 개발하기 (상)"))
        case characterCategory.qa.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "QA 역할과 소프트웨어 테스팅 기본 개념(테스팅 용어, 절차, 테스트 계획) 학습하기", todoDetail: "QA 역할과 소프트웨어 테스팅 기본 개념(테스팅 용어, 절차, 테스트 계획) 학습하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "버그 관리 도구 사용법 학습하기 (예: JIRA, Bugzilla)", todoDetail: "버그 관리 도구 사용법 학습하기 (예: JIRA, Bugzilla) (상)"))
        case characterCategory.embeded.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "선택한 실시간 운영체제 관련 코드와 튜토리얼 하루에 1개 학습하기", todoDetail: "선택한 실시간 운영체제 관련 코드와 튜토리얼 하루에 1개 학습하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "실제 프로젝트에 실시간 운영체제를 적용해보기", todoDetail: "실제 프로젝트에 실시간 운영체제를 적용해보기 (상)"))
        case characterCategory.ai.displayJobName:
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "Scikit-learn, TensorFlow, PyTorch 등의 머신러닝 라이브러리 학습하기", todoDetail: "Scikit-learn, TensorFlow, PyTorch 등의 머신러닝 라이브러리 학습하기 (하)"))
            todQuenst.append(ToDoModel(keyDate: Date(), toDoType: .tod, todo: "실제 데이터셋을 활용하여 머신러닝 및 딥러닝 프로젝트 수행하기", todoDetail: "실제 데이터셋을 활용하여 머신러닝 및 딥러닝 프로젝트 수행하기 (상)"))
        default:
            break
        }
        return todQuenst
    }
    
    func add(ToDoModel acData:ToDoModel?) -> Bool {
        if let data = acData {
            toDoList.insert(data, at: 0)
            
             UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoList), forKey: ToDoDataManager.TODO_DATA_LIST_KEY)
//            return UserDefaults.standard.synchronize()
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
//        UserDefaults.standard.synchronize()
    }
    
}
