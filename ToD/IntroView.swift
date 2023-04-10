//
//  IntroView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct IntroView: View {
    
    var body: some View {
        
        NavigationView{
            VStack{
                Image("logowithname")
                Spacer()
                Text("아직 함께 할 친구가 없네요🥲")
                    .font(.headline)
                    .padding(.bottom)
                Text("친구를 찾아볼까요?")
                    .font(.headline)
                    .bold()
                Spacer()
                
                
                NavigationLink{
                    SelectAnswerView()
                        .toolbarRole(.editor)
                }label:{
                    Text("네 같이 찾아봐요!")
                        .font(.headline)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(30)
                        .foregroundColor(.white)
                }.background(.blue)
                    .cornerRadius(15)
                    .padding(.vertical)
            }
        }
        
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
