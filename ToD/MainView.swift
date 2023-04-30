//
//  Main.swift
//  ToD
//
//  Created by yimkeul on 2023/04/07.
//

import SwiftUI



struct MainView: View {
    @AppStorage("isChar") var isChar: Bool = false
    
    @EnvironmentObject var loginState : ObservableLogin
    
    
    var body: some View {
        NavigationView{
            if loginState.login{
                ToDoView()
            }else{
                IntroView()
            }
        }

        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ObservableLogin())
    }
}
