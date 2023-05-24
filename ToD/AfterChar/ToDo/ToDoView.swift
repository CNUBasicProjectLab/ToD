//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI


struct ToDoView: View {
    var todoDataManager: ToDoDataManager = ToDoDataManager.shared
    @AppStorage("isChar") var isChar: Bool = true
    @State private var showModal: Bool = false
    @State var todoCategory: Category = .dev
    @State var todoList: [ToDoModel] = []
    @Environment(\.refresh) private var refresh
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView{
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 280)
                                .foregroundColor(Color.secondary)
                                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                            Text("투디 이미지 미리보기")
                        }
                        Divider()
                        Picker("투디 퀘스트", selection: $todoCategory) {
                            ForEach(Category.allCases, id: \.self) { todItem in
                                Text(todItem.displayCategory)
                                    .tag(todItem)
                            }
                        }
                        .onChange(of: todoCategory) { newValue in
                            
                        }
                        .pickerStyle(.segmented)
                        
                        Spacer()
                        List {
                            ForEach(todoList, id: \.self) { list in
                                if (list.toDoType == todoCategory) {
                                    toDoListRow(todo: list)
                                } else {
                                    
                                }
                                
                            }
                        }
                        .onAppear {
                            getToDoList()
                        }
                        .refreshable {
                            getToDoList()
                        }
                        
                        
                    }.padding()
                }
                Button {
                    isChar = false
                } label: {
                    Text("다시 false로")
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
    
    func getToDoList() {
        let todos: [ToDoModel] = todoDataManager.getToDoList()
        todoList = todos
    }
    
}

struct toDoListRow: View {
    var todo: ToDoModel
    
    var body: some View {
        NavigationLink {
            toDoListRow(todo: todo)
        } label: {
            VStack(alignment: .leading) {
                Text(todo.todo)
                    .foregroundColor(.black)
                
                Text(todo.todoDetail)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
    }
    
}



struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
