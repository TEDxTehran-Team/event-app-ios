//
//  WebView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  
  var url: String
  
  func makeUIView(context: Context) -> WKWebView {
    guard let url = URL(string: url) else {
      return WKWebView()
    }
    let request = URLRequest(url: url)
    let webView = WKWebView()
    webView.load(request)
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    
  }
  
}
