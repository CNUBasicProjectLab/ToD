//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI


struct ToDoView: View {
    @AppStorage("myJobCategory") var myJob: String!
    @ObservedObject var todoDataManager: ToDoDataManager = ToDoDataManager.shared
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
                    HStack{
                        Button {
                            todoDataManager.toDoList = []
                            isChar = false
                        } label: {
                            Label("Profile", systemImage: "exclamationmark.circle.fill" )
                                .foregroundColor(Color.red)
                        }
                        
                        NavigationLink {
                            BoardView()
                                .toolbarRole(.editor)
                        } label: {
                            Label("Profile", systemImage: "ellipsis.bubble")
                        }

                        
                        
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
    }
    
    var toDCharacter: some View {
        VStack {
            switch myJob {
            case characterCategory.frontEnd.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.server.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.moblie.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.sw.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.security.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.qa.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.embeded.displayJobName:
                Image("default_character")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
            case characterCategory.ai.displayJobName:
                Image("default_character")
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
    @State var toDoList: [ToDoModel] = []
    @ObservedObject var todoDataManager: ToDoDataManager = ToDoDataManager.shared
    
    var body: some View {
        NavigationLink {
            ToDoDetailView(todo: todo)
        } label: {
//            Divider()
            HStack(spacing: 20) {
                Image(systemName: todo.isComplete ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .animation(.default, value: todo.isComplete)
                    .onTapGesture {
                        var updateTodo = todo
                        updateTodo.isComplete.toggle()
                        todoDataManager.updateToDoItem(updateTodo)
                        toDoList = todoDataManager.toDoList
                    }
                VStack(alignment: .leading) {
                    Text(todo.todo)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.title3)
                    Text(todo.todoDetail)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                        .foregroundColor(.gray)
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
