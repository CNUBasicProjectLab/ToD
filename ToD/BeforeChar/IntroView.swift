//
//  IntroView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct IntroView: View {
    
    var body: some View {
        
            VStack{
                Image("logowithname")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 103 , height: 50)
//                Spacer()
                
//                Image("IntroNotCharacter")
                
                LottieView(filename: "intro")
                              .frame( height: 250)
                
                Text("지금부터 개발자까지")
                    .font(.system(size : 20, weight: .black))
                    .padding(.bottom)
                Text("투디는 여러분이 개발자의 꿈을 함께 키워 나가는 서비스입니다. 어떤 개발자가 되고 싶은지 고민이신 분들도 도와드립니다.")
                    .frame(width: 260)
                    .font(.system(size : 15, weight: .semibold))
                    .foregroundColor(.gray)
                    .padding(.horizontal , 30)
                
                Spacer()
                
                NavigationLink{
                    SelectAnswerView()
                        .toolbarRole(.editor)
                }label:{
                    Text("시작하기")
                        .font(.headline)
                        .frame(width: 283,height: 60)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                }
                Spacer()
                
            }
            
        
        
        
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
