//
//  BoardView.swift
//  ToD
//
//  Created by yimkeul on 2023/05/07.
//

import SwiftUI

struct BoardView: View {
    var jobList : [String] = ["서버 / 백엔드", "프론트앤드", "모바일", "SW / 솔루션", "보안", "QA 엔지니어", "임베디드", "인공지능 / 머신러닝"]
    var boardDataManager: BoardDataManager = BoardDataManager.shared
    var boardList: [BoardModel] = []
    @Environment(\.refresh) private var refresh
    @State private var isRefreshing = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    Text("직군 카테고리 선택")
                    Spacer()
                    List {
                        ForEach(Array(boardDataManager.getList().enumerated()), id: \.offset) { idx, data in
                            BoardListRow(board: data)
                        }
                    }
                    .refreshable {
                        print("Refresh!!")
                    }
                }
            }
            
            HStack {
                Spacer(minLength: 5)
                NavigationLink {
                    CreateBoardView()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                        .padding(30)
                }
            }
        }
    }
    func refresh() async {
        
    }
}

struct BoardListRow: View {
    var board:BoardModel
    
    var body: some View {
        NavigationLink {
            BoardDetailView(board: board)
        } label: {
            VStack(alignment: .leading) {
                Text("직군: " + board.job.displayJobName)
                    .font(.callout)
                Text(board.title)
                    .padding(.bottom)
                    .bold()
                
                Text(board.contents)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
