//
//  CreateCharacterView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct CreateCharacterView: View {
    @AppStorage("isChar") var isChar: Bool = false
    @State var index: Int = -1
    var body: some View {
        
        VStack{
            Spacer()
            VStack(){
                Text("어떤 직종을 희망하시나요?")
                    .font(.system(size : 20, weight: .semibold))
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding()
            //            상단 아이콘
            HStack(alignment: .center, spacing: 10){
                VStack{
                    Image("back")
                        .resizable()
                        .frame(width: index != 0 ? 50 : 70,height: index != 0 ? 50 : 70)
                    Text("서버/\n백엔드")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 0
                }
                .animation(.easeIn, value: index)
                VStack{
                    Image("front")
                        .resizable()
                        .frame(width: index != 1 ? 50 : 70,height: index != 1 ? 50 : 70)
                    Text("프론트엔드")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 1
                }
                .animation(.easeIn, value: index)
                VStack{

                    Image("mobile")
                        .resizable()
                        .frame(width: index != 2 ? 50 : 70,height: index != 2 ? 50 : 70)

                    Text("모바일\n")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 2
                }
                .animation(.easeIn, value: index)
                VStack{
                    Image("swsolution")
                        .resizable()
                        .frame(width: index != 3 ? 50 : 70,height: index != 3 ? 50 : 70)
                    
                    Text("SW/\n솔루션")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 3
                }
                .animation(.easeIn, value: index)
            }
            .padding(.bottom)
            //            하단 아이콘
            HStack(spacing: 10){
                VStack{
                    Image("security")
                        .resizable()
                        .frame(width: index != 4 ? 50 : 70,height: index != 4 ? 50 : 70)

                    Text("보안\n")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 4
                }
                .animation(.easeIn, value: index)
                VStack{
                    Image("bug")
                        .resizable()
                        .frame(width: index != 5 ? 50 : 70,height: index != 5 ? 50 : 70)

                    Text("QA엔지니어")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 5
                }
                .animation(.easeIn, value: index)
                VStack{
                    Image("embedded")
                        .resizable()
                        .frame(width: index != 6 ? 50 : 70,height: index != 6 ? 50 : 70)

                    Text("임베디드\n")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 6
                }
                .animation(.easeIn, value: index)
                VStack{
                    Image("ai")
                        .resizable()
                        .frame(width: index != 7 ? 50 : 70,height: index != 7 ? 50 : 70)

                    Text("인공지능/\n머신러닝")
                }
                .frame(width: 80)
                .onTapGesture {
                    index = 7
                }
                .animation(.easeIn, value: index)
            }
//            .padding()
            
            RoundedRectangle(cornerRadius: 15 , style: .continuous)
                .fill(Color.gray)
                .padding()
                .overlay(Text("투디 미리보기")
                .foregroundColor(Color.white))
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
                Text("생성하기")
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
