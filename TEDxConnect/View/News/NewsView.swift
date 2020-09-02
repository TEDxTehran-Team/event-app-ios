//
//  NewsView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                List(viewModel.repositories, id: \.self) { news in
                    NewsCardView(news: news)
                }
            }
            
            if self.viewModel.statusView == .loading {
                Indicator()
            }
            
            if self.viewModel.statusView == .error {
                Text(self.viewModel.errorMessage)
                    .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
            }
            
            
        }
            
        .navigationBarColor(UIColor(named: "primaryRed"))
        .navigationBarTitle(Text("News"))
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            self.viewModel.setup()
        }
        .onDisappear {
            UITableView.appearance().separatorStyle = .singleLine
        }
    }
    
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
