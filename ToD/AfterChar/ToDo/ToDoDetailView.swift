//
//  ToDoDetailView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/24.
//

import SwiftUI

struct ToDoDetailView: View {
    @State var todo: ToDoModel
    @State var contents: String = ""
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading, spacing: 16) {
                HStack {
                    Text(todo.todo)
                        .font(.title)
//                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                    Text("")
                }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.black.opacity(0.2), lineWidth: 2)
                )
            }
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(todo.todoDetail)
                        .padding()
                    Spacer()
                }
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(Color.black.opacity(0.2), lineWidth: 2)
            )
            Spacer()
        }
        .padding()
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoDetailView(todo: ToDoModel(keyDate: Date(), toDoType: .dev, todo: "개발 할 일", todoDetail: "개발 할 일 세부사항", isComplete: false))
    }
}
