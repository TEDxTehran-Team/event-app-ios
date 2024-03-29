//
//  NewsCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct NewsCardView: View {
    
    @State var news: News
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Colors.primaryBackground)
                .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3)
            
            VStack(alignment: .center) {
                HStack(alignment: .center, spacing: 20) {
                    
                    KFImage(URL(string: Images.urlExtension + (news.icon ?? ""))!)
                        .placeholder {
                            ImagePlaceholder()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 30)
                   
                    LocalizedNumberText(news.title)
                        .multilineTextAlignment(.center)
                        .customFont(name: Configuration.shabnam, style: .body, weight: .bold)
                        .foregroundColor(.primary)
                                        
                    Spacer()
                }
                LocalizedNumberText(news.description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                    .padding(.top)
            }
            .padding(20)
        }
    
        .onTapGesture {
            if let url = URL(string: self.news.extraLink ?? "") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        .padding(.vertical, 10)
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News.example)
    }
}
