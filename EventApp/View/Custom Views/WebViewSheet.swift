//
//  WebViewSheet.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct WebViewSheet: View {
  
  @Environment(\.presentationMode) var presentationMode
  let url: String
  let titleLocalizedKey: String
  
  var body: some View {
    NavigationView {
      WebView(url: url)
        .navigationBarTitle(Text(titleLocalizedKey.localized()), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "xmark")
            .foregroundColor(Colors.primaryRed)
        }))
    }
  }
}

struct WebViewSheet_Previews: PreviewProvider {
  static var previews: some View {
    WebViewSheet(url: "", titleLocalizedKey: "")
  }
}
