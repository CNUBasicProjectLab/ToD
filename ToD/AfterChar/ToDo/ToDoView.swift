//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI


struct ToDoView: View {
    var dataManager: ToDoDataManager = ToDoDataManager.shared
    
    @AppStorage("isChar") var isChar: Bool = true
    @State private var showModal: Bool = false
    @State var toDo: toDoItem = .tod

    var body: some View {
        NavigationView {
            VStack {
                ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 280)
//                        .padding()
                        .foregroundColor(Color.secondary)
                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                    Text("투디 이미지 미리보기")
                }
                Divider()
                    Picker("투디 퀘스트", selection: $toDo) {
                        ForEach(toDoItem.allCases, id: \.self) { todItem in
                            Text(todItem.displayToDoItemName)
                                .tag(todItem)
                        }
                    }
                    .onChange(of: toDo) { newValue in
                        
                    }
                    .pickerStyle(.segmented)
                    
                Spacer()
                    VStack
                    {
                        HStack{
                            Image("Daily")
                            VStack(alignment : .leading){
                                Text("Title")
                                Text("SubTitle").font(.caption)
                            }.padding(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                            
                        }
                        .padding()
                        
                        HStack{
                            Image("Week")
                            VStack(alignment : .leading){
                                Text("Title")
                                Text("SubTitle").font(.caption)
                            }.padding(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                            
                        }
                        .padding()
                        
                        HStack{
                            Image("Month")
                            VStack(alignment : .leading){
                                Text("Title")
                                Text("SubTitle").font(.caption)
                            }.padding(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                            
                        }
                        .padding()
                        
                        HStack{
                            Image("Year")
                            VStack(alignment : .leading){
                                Text("Title")
                                Text("SubTitle").font(.caption)
                            }.padding(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                            
                        }
                        .padding()
                        
                        HStack{
                            Image("Mission")
                            VStack(alignment : .leading){
                                Text("Title")
                                Text("SubTitle").font(.caption)
                            }.padding(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle").foregroundColor(.green)
                            
                        }
                        .padding()
                    }
                    
                    
                    
                }.padding()
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
}



struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
