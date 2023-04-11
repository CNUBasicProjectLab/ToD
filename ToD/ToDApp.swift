//
//  ToDApp.swift
//  ToD
//
//  Created by yimkeul on 2023/04/07.
//

import SwiftUI

@main
struct ToDApp: App {
    
    init() {
            Thread.sleep(forTimeInterval: 2)
        }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
