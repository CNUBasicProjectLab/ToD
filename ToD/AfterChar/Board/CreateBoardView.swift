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
    @State private var isTouched: Bool = false
    @State private var isComplete: Bool = false
    
    @Environment(\.presentationMode) var presentation
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
                    .fontWeight(.semibold)
                    .font(.callout)
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
        }
    }
    
    var InputArea: some View {
        NavigationStack {
            VStack {
                PickerArea
                TextField("제목 입력하기", text: $title)
                    .font(.title2)
                    .keyboardType(.default)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke().opacity(0.5)
                    }
                ZStack {
                    TextEditor(text: $content)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                        )
                        .keyboardType(.default)
                        .onTapGesture {
                            isTouched = true
                        }
                    if isTouched == false {
                        Text("게시글 내용을 입력해주세요.")
                            .font(.title3)
                            .opacity(0.35)
                    }
                }
            }
            .padding()
        }
    }
    
    var BottomArea: some View {
        VStack {
            Button {
                let result = addData()
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("완료")
                    .frame(width: 70)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct CreateBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateBoardView()
    }
}
