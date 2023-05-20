//
//  BoardInputModal.swift
//  ToD
//
//  Created by 문영균 on 2023/05/18.
//

import SwiftUI

struct BoardInputModal: View {
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss
    
    var dataManager: BoardDataManager = BoardDataManager.shared
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BoardInputModal_Previews: PreviewProvider {
    static var previews: some View {
        BoardInputModal(isPresented: .constant(true))
    }
}
