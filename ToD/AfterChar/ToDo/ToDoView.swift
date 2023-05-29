//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI


struct ToDoView: View {
    @AppStorage("myJobCategory") var myJob: String!
    var todoDataManager: ToDoDataManager = ToDoDataManager.shared
    @AppStorage("isChar") var isChar: Bool = true
    @State private var showModal: Bool = false
    @State var todoCategory: Category = .dev
    @Environment(\.refresh) private var refresh
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
                    VStack(alignment: .center) {
                        toDCharacter
                        Divider()
                        toDPicker
                        toDQuest
                    }
                    .padding()
                }
                Button {
                    todoDataManager.toDoList = []
                    isChar = false
                } label: {
                    Text("다시 false로")
                }
                
            }
            .onAppear {
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        Image("LogoBgx")
                            .resizable()
                            .frame(width: 32,height: 32)
                        Text("투디")
                            .font(.system(size : 24, weight: .semibold))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showModal = true
                    } label: {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
                    .sheet(isPresented: $showModal) {
                        CreateToDoView()
                    }
                }
            }
        }
    }
    
    var toDCharacter: some View {
        VStack {
            switch myJob {
            case characterCategory.frontEnd.displayJobName:
                Image("frontend_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.server.displayJobName:
                Image("backend_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.moblie.displayJobName:
                Image("moblie_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.sw.displayJobName:
                Image("sw_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.security.displayJobName:
                Image("security_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.qa.displayJobName:
                Image("qa_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.embeded.displayJobName:
                Image("embeded_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.ai.displayJobName:
                Image("ai_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
            default:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            }
        }
    }
    
    var toDPicker: some View {
        Picker("투디 퀘스트", selection: $todoCategory) {
            ForEach(Category.allCases, id: \.self) { todItem in
                Text(todItem.displayCategory)
                    .tag(todItem)
            }
        }
        .onChange(of: todoCategory) { newValue in
            
        }
        .pickerStyle(.segmented)
    }
    
    var toDQuest: some View {
        VStack(alignment: .leading) {

            ForEach(Array(todoDataManager.getToDoList(jobCategory: myJob).enumerated()), id: \.offset) { idx, data in
                if (data.toDoType == todoCategory) && (data.isComplete == false) {
                    ToDoListRow(todo: data)
                }
            }
        }
        .padding()
    }
    
}

struct ToDoListRow: View {
    @State var todo: ToDoModel
    var todoDataManager: ToDoDataManager = ToDoDataManager.shared
    
    var body: some View {
        NavigationLink {
            ToDoDetailView(todo: todo)
        } label: {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text(todo.todo)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.title3)
                        .lineLimit(15)
                    
                    
                    Text(todo.todoDetail)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: todo.isComplete ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .animation(.default, value: todo.isComplete)
                    .onTapGesture {
                        var updateTodo = todo
                        updateTodo.isComplete.toggle()
                        todoDataManager.updateToDoItem(updateTodo)
                    }
            }
        }
    }
    
}



struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
//            .previewLayout(.device)
    }
}
