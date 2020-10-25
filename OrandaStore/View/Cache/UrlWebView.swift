//
//  UrlWebView.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/25/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import WebKit

struct UrlWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    var urlToDisplay: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        webView.load(URLRequest(url: urlToDisplay))
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
