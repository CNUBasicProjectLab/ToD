//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI

struct ToDoView: View {
    @AppStorage("isChar") var isChar: Bool = true
    
    @EnvironmentObject var loginState : ObservableLogin
    var body: some View {
        VStack{
            Text("ToDoView")
            Button {
//                isChar = false
                loginState.login = false
            } label: {
                Text("다시 false로")
            }

        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView().environmentObject(ObservableLogin())
    }
}
