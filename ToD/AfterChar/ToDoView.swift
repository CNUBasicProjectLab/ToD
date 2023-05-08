//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI

struct ToDoView: View {
    @AppStorage("isChar") var isChar: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("ToDoView")
                Button {
                    isChar = false
                } label: {
                    Text("다시 false로")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("투디")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("tap!")
                    } label: {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
                    
                }
                
            }
            
        }
    }
}



struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
