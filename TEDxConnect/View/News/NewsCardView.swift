//
//  NewsCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct NewsCardView: View {
  let news: News
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Color.backgorund)
        .shadow(radius: 8)
      
      VStack(alignment: .leading) {
        HStack(alignment: .center, spacing: 20) {
          Image(news.icon)
            .resizable()
            .scaledToFit()
            .frame(width: 65, height: 40)
          Text(news.title)
            .font(.title)
            .foregroundColor(.primary)
        }
        Text(news.description)
          .foregroundColor(.secondary)
      }
      .padding(20)
    }
    .padding(.vertical, 10)
  }
}

struct NewsCardView_Previews: PreviewProvider {
  static var previews: some View {
    NewsCardView(news: News.example)
  }
}
