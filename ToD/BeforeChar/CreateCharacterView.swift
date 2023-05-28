//
//  CreateCharacterView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct CreateCharacterView: View {
    @AppStorage("isChar") var isChar: Bool = false
    @AppStorage("myJobCategory") var myJob: String = ""
    @State var index: Int = -1
    var body: some View {
        VStack{
            //            Spacer()
            VStack(){
                Text("어떤 직종을 희망하시나요?")
                    .font(.system(size : 20, weight: .semibold))
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding()
            VStack {
                //            상단 아이콘
                HStack(alignment: .center, spacing: 10) {
                    VStack{
                        Image("back")
                            .resizable()
                            .frame(width: index != 0 ? 50 : 60,height: index != 0 ? 50 : 60)
                        Text("서버/백엔드")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 0
                        myJob = characterCategory.server.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        Image("front")
                            .resizable()
                            .frame(width: index != 1 ? 50 : 60,height: index != 1 ? 50 : 60)
                        Text("프론트엔드")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 1
                        myJob = characterCategory.frontEnd.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        
                        Image("mobile")
                            .resizable()
                            .frame(width: index != 2 ? 50 : 60,height: index != 2 ? 50 : 60)
                        
                        Text("모바일")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 2
                        myJob = characterCategory.moblie.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        Image("swsolution")
                            .resizable()
                            .frame(width: index != 3 ? 50 : 60,height: index != 3 ? 50 : 60)
                        
                        Text("SW/솔루션")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 3
                        myJob = characterCategory.sw.displayJobName
                    }
                    .animation(.easeIn, value: index)
                }
                
                //            하단 아이콘
                HStack(spacing: 10) {
                    VStack{
                        Image("security")
                            .resizable()
                            .frame(width: index != 4 ? 50 : 60,height: index != 4 ? 50 : 60)
                        
                        Text("보안")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 4
                        myJob = characterCategory.security.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        Image("bug")
                            .resizable()
                            .frame(width: index != 5 ? 50 : 60,height: index != 5 ? 50 : 60)
                        
                        Text("QA엔지니어")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 5
                        myJob = characterCategory.qa.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        Image("embedded")
                            .resizable()
                            .frame(width: index != 6 ? 50 : 60,height: index != 6 ? 50 : 60)
                        
                        Text("임베디드")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 6
                        myJob = characterCategory.embeded.displayJobName
                    }
                    .animation(.easeIn, value: index)
                    VStack{
                        Image("ai")
                            .resizable()
                            .frame(width: index != 7 ? 50 : 60,height: index != 7 ? 50 : 60)
                        
                        Text("인공지능/머신러닝")
                            .minimumScaleFactor(0.5)
                    }
                    .frame(width: 80)
                    .onTapGesture {
                        index = 7
                        myJob = characterCategory.ai.displayJobName
                    }
                    .animation(.easeIn, value: index)
                }
            }
            .frame(height: 230)
            VStack {
                switch myJob {
                case characterCategory.frontEnd.displayJobName:
                    Image("frontend")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.server.displayJobName:
                    Image("backend")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.moblie.displayJobName:
                    Image("mobile")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.sw.displayJobName:
                    Image("sw")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.security.displayJobName:
                    Image("security")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.qa.displayJobName:
                    Image("qa")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.embeded.displayJobName:
                    Image("embeded")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                case characterCategory.ai.displayJobName:
                    Image("ai")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                    
                default:
                    RoundedRectangle(cornerRadius: 15 , style: .continuous)
                        .fill(Color.gray)
                        .padding()
                        .overlay(Text("투디 미리보기")
                            .foregroundColor(Color.white))
                    
                }
            }
            //            RoundedRectangle(cornerRadius: 15 , style: .continuous)
            //                .fill(Color.gray)
            //                .padding()
            //                .overlay(Text("투디 미리보기")
            //                .foregroundColor(Color.white))
            
            VStack(alignment :.leading){
                Text("⚠️ 주의")
                    .font(.system(size : 20, weight: .semibold))
                    .padding()
                Text("한 번 생성한 투디 개발자를 를 변경하는 경우, 투디의 성장은 초기화 됩니다. 다만, 여러분이 실제로 경험하고 성장하는 것과 무관합니다. 이에 주의해주시기 바랍니다.")
                    .font(.system(size : 15))
                    .padding(.horizontal)
                
            }
            Button {
                isChar = true
            } label: {
                Text("ToD 캐릭터 생성하기")
                    .font(.headline)
                    .frame(maxWidth: 200)
                    .foregroundColor(.white)
                    .padding()
            }.background(.blue)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 2, x: 0, y: 3)
                .padding(.vertical)
        }
    }
}

struct CreateCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCharacterView()
    }
}
