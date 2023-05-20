//
//  CreateBoardView.swift
//  ToD
//
//  Created by 문영균 on 2023/05/20.
//

import SwiftUI

struct CreateBoardView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var job: JobItem = .frontEnd
    
    var dataManager: BoardDataManager = BoardDataManager.shared
    
    func addData() -> Bool {
        let newData = BoardModel(keyDate: Date(), title: title, contents: content, job: job)
        let result = dataManager.add(BoardModel: newData)
        return !result
    }
    var body: some View {
        VStack {
            InputArea
                .padding()
            Spacer()
            BottomArea
        }
    }
    
    var PickerArea: some View {
        VStack {
            HStack {
                Text("직군을 입력해주세요")
                    .font(.callout)
                Spacer()
                Picker("", selection: $job) {
                    ForEach(JobItem.allCases, id: \.self) { jobItem in
                        Text(jobItem.displayJobName)
                            .tag(jobItem)
                    }
                }
                .onChange(of: job) { newValue in
                    
                }
                .pickerStyle(.menu)
            }
        }
    }
    
    var InputArea: some View {
        VStack {
            PickerArea
            TextField("제목 입력하기", text: $title)
                .font(.title)
                .keyboardType(.default)
            TextField("...입력하기...", text: $content)
                .font(.title2)
                .keyboardType(.default)
        }
    }
    var BottomArea: some View {
        VStack {
            Button {
                let result = addData()
                
            } label: {
                Text("완료")
            }

        }
    }
}

struct CreateBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBoardView()
    }
}
