//
//  ContentView.swift
//  ToD
//
//  Created by yimkeul on 2023/04/07.
//

import SwiftUI
import WebKit

struct WebContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                WebView(url: URL(string: "https://todacc.netlify.app/")!)
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webView.allowsBackForwardNavigationGestures = true
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webView.load(request)
    }
}

struct WebContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebContentView()
    }
}
