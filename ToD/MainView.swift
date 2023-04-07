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
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Divider()
                NavigationLink {
                    WebContentView()
                } label: {
                    Text("Navigate")
                }


            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
