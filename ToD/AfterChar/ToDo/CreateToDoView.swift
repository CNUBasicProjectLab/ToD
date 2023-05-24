//
//  CreateToDoView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/08.
//

import SwiftUI

struct CreateToDoView: View {
//    var category = ["Daily", "Week", "Month", "Year"]
    @Environment(\.dismiss) private var dissmiss
    @State private var showModal: Bool = false
    @State var selectedCategory: Category = .dev
    @State var title = ""
    @State var content = ""
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
            Button {
                dissmiss()
            } label: {
                Text("완료")
                    .frame(width: 100, height: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(7)
            }
            
            
        }
        
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView()
    }
}
