//
//  LoadingView.swift
//  EventApp
//
//  Created by Alireza on 8/12/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("loading_chat".localized())
                .customFont(name: Configuration.shabnam, size: 25, weight: .regular)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(30)
            
            LottieView(name: "cat", loopMode: .loop)
                .frame(width: UIScreen.main.bounds.width, height: 300)
            
            Text("cancel_search".localized())
                .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
                .frame(width: 290, height: 62, alignment: .center)
                .foregroundColor(Color.white)
                .background(Colors.primaryRed)
                .cornerRadius(5)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
