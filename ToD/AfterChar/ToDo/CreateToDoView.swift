//
//  CreateToDoView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/08.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) private var dissmiss
    @State private var showModal: Bool = false
    @State private var isNotComplete: Bool = false
    @State var selectedCategory: Category = .dev
    @State var title = ""
    @State var content = ""
    var dataManager: ToDoDataManager = ToDoDataManager.shared
    
    var body: some View {
        
        VStack {
            HStack {
                Text("투디")
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
                Text("")
            }
            Picker("Choose a ToDo category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { todItem in
                    if todItem.displayCategory != "투디 퀘스트" {
                        Text(todItem.displayCategory)
                            .tag(todItem)
                    }
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(7)
            .padding()
            Divider()
            
            VStack {
                TextField("투디 타이틀", text: $title)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $content)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black.opacity(0.07), lineWidth: 1)
                    )
            }
            .frame(height: 500)
            .padding()
            BottomArea
        }
    }
    
    var BottomArea: some View {
        VStack {
            Button {
                isNotComplete = isNotCompleteContent()
                if !isNotComplete {
                    let _ = addData()
                    dataManager.saveToDoList()
                    dissmiss()
                }
            } label: {
                Text("완료")
                    .frame(width: 70)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert(Text("오류"), isPresented: $isNotComplete) {
                Button("확인") {}
            } message: {
                Text("투디 타이틀을 입력해주세요.")
            }
        }
    }
    
    func isNotCompleteContent() -> Bool {
        if title == "" {
            return true
        } else {
            return false
        }
    }
    
    func addData() -> Bool {
        let newData = ToDoModel(keyDate: Date(), toDoType: selectedCategory, todo: title, todoDetail: content, isComplete: false)
        let result = dataManager.add(ToDoModel: newData)
        return !result
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView()
    }
}
