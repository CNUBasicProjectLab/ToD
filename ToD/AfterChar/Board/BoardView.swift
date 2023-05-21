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
    @State var job: JobItem = .ai
    @State var boardList: [BoardModel] = []
    @Environment(\.refresh) private var refresh
    @State private var isRefreshing = false
    
    var body: some View {
        
        
        
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Text("직군 카테고리 선택:")
                        Spacer()
                        Picker("직군 선택 픽커", selection: $job) {
                            ForEach(JobItem.allCases, id: \.self) { jobItem in
                                Text(jobItem.displayJobName)
                                    .tag(jobItem)
                            }
                        }
                        .onChange(of: job) { newValue in
                            
                        }
                    .pickerStyle(.menu)
                    
                    }
                    .padding()
                    Spacer()
                    List {
                        ForEach(boardList, id: \.self) { list in
                            BoardListRow(board: list)
                        }
                    }
                    .onAppear {
                        getBoardList()
                    }
                    .refreshable {
                        getBoardList()
                    }
                }
                
                VStack {
                    Text("")
                    Spacer()
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
        }
    }
    
    func getBoardList() {
        let boards: [BoardModel] = boardDataManager.getList()
        boardList = boards
    }
}

struct BoardListRow: View {
    var board:BoardModel
    
    var body: some View {
        NavigationLink {
            BoardDetailView(board: board)
        } label: {
            VStack(alignment: .leading) {
                Text(board.job.displayJobName)
                    .font(.callout)
                    .foregroundColor(.gray)
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
