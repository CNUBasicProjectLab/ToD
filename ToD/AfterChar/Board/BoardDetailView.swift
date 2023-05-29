//
//  BoardDetailView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/18.
//

import SwiftUI

struct BoardDetailView: View {
    @State var board: BoardModel
    @State var contents: String = ""
    var body: some View {
        VStack (alignment: .leading) {
            VStack (alignment: .leading, spacing: 16) {
                HStack {
                    Text(board.title)
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Spacer()
                    Text("")
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.black.opacity(0.2), lineWidth: 2)
                )
            }
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(board.contents)
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

struct BoardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoardDetailView(board: BoardModel(keyDate: Date(), title: "제목", contents: "내용", job: .frontEnd))
    }
}
