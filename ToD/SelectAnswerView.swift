//
//  SelectAnswerView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct SelectAnswerView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("logowithname")
                Spacer()
                Text("되고 싶은 개발자 직종을 정하셨나요?")
                    .font(.headline)
                    .padding(.bottom)
                Spacer()
                
                
                NavigationLink{
                    CreateCharacterView()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    Text("네 정했습니다!")
                        .font(.headline)
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding()
                }.background(.blue)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.vertical)
                
                
                NavigationLink{
                    WebContentView()
                        .navigationBarBackButtonHidden(true)
                }label:{
                    VStack{
                        Text("네 같이 찾아봐요!")
                            .font(.headline)
                            .frame(width: 200)
                            .foregroundColor(.black)
                        Text("진로 검사 해보기")
                    }.padding()
                    
                }.background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .padding(.vertical)
                
                Spacer()
            }
        }
    }
}

struct SelectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAnswerView()
    }
}
