//
//  CreateToDoView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/08.
//

import SwiftUI

struct CreateToDoView: View {
    var category = ["Daily", "Week", "Month", "Year"]
    @State var selectedCategory = ""
    @State var title = ""
    @State var content = ""
    var body: some View {
        
        VStack {
            HStack {
                Text("투두 카테고리")
                    .font(.title2)
                    .bold()
                    .padding()
                Spacer()
                Text("")
            }
            Picker("Choose a ToDo category", selection: $selectedCategory) {
                ForEach(category, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(7)
            .padding()
            Divider()
            
            VStack {
                TextField("투두 타이틀", text: $title)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $content)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black.opacity(0.07), lineWidth: 1)
                    )
            }
            .padding()
            Spacer()
            Button {
                
            } label: {
                Text("완료")
            }
        }
        
    }
}

struct CreateToDoView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoView()
    }
}
