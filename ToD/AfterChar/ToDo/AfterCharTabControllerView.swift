//
//  AfterCharTabControllerView.swift
//  ToD
//
//  Created by yimkeul on 2023/05/07.
//

import SwiftUI

struct AfterCharTabControllerView: View {
    @AppStorage("isChar") var isChar: Bool = true
    var body: some View {
        TabView{
            ToDoView().tabItem {
                Text("todoview")
            }
            
            BoardView().tabItem {
                Text("BoardView")
            }
        }
    }
}

struct AfterCharTabControllerView_Previews: PreviewProvider {
    static var previews: some View {
        AfterCharTabControllerView()
    }
}
