//
//  Main.swift
//  ToD
//
//  Created by yimkeul on 2023/04/07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
     
    
        
        
        NavigationView {
            IntroView()
            
//                VStack{
//                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                        Divider()
//                    NavigationLink {
//                        WebContentView()
//                    } label: {
//                        Text("Navigate")
//                    }
//                }
            
    
            
            
        }
        
    }
}

//extension MainView {
//    var launchScreenView: some View {
//        ZStack(alignment: .center) {
//                    
//                    LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]),
//                                    startPoint: .top, endPoint: .bottom)
//                    .edgesIgnoringSafeArea(.all)
//                    
//                    Image("LaunchImage")
//                    
//                }
//    }
//}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
