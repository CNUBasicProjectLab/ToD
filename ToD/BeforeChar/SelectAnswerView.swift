//
//  SelectAnswerView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/11.
//

import SwiftUI

struct SelectAnswerView: View {
    @AppStorage("isChar") var isChar: Bool = false
    var body: some View {
        VStack{
            Image("logowithname")
                .resizable()
                .scaledToFit()
                .frame(width: 103 , height: 50)
            
            LottieView(filename: "thinking")
                .frame(width: 200, height: 250)
            Text("희망하는 개발자가 있나요?")
                .font(.system(size : 20, weight: .semibold))
                .padding(.bottom)
            Text("원하는 개발자가 생각이 안난다면 투디가 도와드릴게요")
            //                    .frame(width: 260)
                .font(.system(size : 15, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.horizontal , 30)
            Text("투디와 함께 알아볼까요?")
                .font(.system(size : 15, weight: .semibold))
                .foregroundColor(.gray)
                .padding(.horizontal , 30)
            Spacer()
            HStack{
                Button{
                    isChar = true
                }label:{
                    VStack{
                        Text("괜찮아요")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                    }.padding()
                }.background(.white)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 0, y: 3)
                    .padding(.vertical)
                //                    NavigationLink{
                //                        CreateCharacterView()
                //                            .navigationBarBackButtonHidden(true)
                //                    }label:{
                //                        VStack{
                //                            Text("괜찮아요")
                //                                .font(.headline)
                //                                .frame(maxWidth: .infinity)
                //                                .foregroundColor(.blue)
                //                        }.padding()
                //                    }.background(.white)
                //                        .cornerRadius(15)
                //                        .shadow(color: .gray, radius: 2, x: 0, y: 3)
                //                        .padding(.vertical)
                
                
                NavigationLink{
                    WebContentView()
                    
                        .navigationBarBackButtonHidden(true)
                }label:{
                    Text("도움 받기")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                }.background(.blue)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 0, y: 3)
                    .padding(.vertical)
            }.padding()
            
            
            
            Spacer()
            
        }
    }
}

struct SelectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAnswerView()
    }
}
