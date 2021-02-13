//
//  EmptyListView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack(spacing: 16) {
//            Image(systemName: "eyes.inverse")
//                .resizable()
//                .frame(width: 100, height: 50)
            Text(LocalizedStringKey("No Results Found"))
                .customFont(name: Configuration.shabnam, style: .title3)
                .foregroundColor(.primary)
        }
        
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
