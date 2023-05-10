//
//  ToDoView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/18.
//

import SwiftUI


struct ToDoView: View {
    @AppStorage("isChar") var isChar: Bool = true
    @State private var showModal: Bool = false

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
                        self.showModal = true
                    } label: {
                        Label("Profile", systemImage: "square.and.pencil")
                    }
                    .sheet(isPresented: $showModal) {
                        CreateToDoView()
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
