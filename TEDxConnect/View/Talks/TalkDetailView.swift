//
//  TalkDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct TalkDetailView: View {
  
  let id: String
  @ObservedObject var viewModel = TalkDetailViewModel()
  
  var body: some View {
    GeometryReader { fullView in
      ScrollView(.vertical) {
        ZStack {
          VStack(alignment: .leading) {
            Button(action: {
              
              UIApplication.shared.open(URL(string: self.viewModel.repository.talk.videoLink ?? Constants.placeholderUrl)!)
              
            }) {
              ZStack {
                RemoteImage(type: .url(URL(string: Images.urlExtension + (self.viewModel.repository.talk.section.image))!), errorView: { _ in
                  ImagePlaceholder()
                }, imageView: { image in
                  image
                    .resizable()
                    .scaledToFill()
                    .frame(width: fullView.size.width, height: 200)
                    .clipped()
                }, loadingView: {
                  Indicator()
                })
                Rectangle()
                  .fill(Color.gray.opacity(0.35))
                  .frame(width: fullView.size.width, height: 200)
                  .overlay(
                    Image(systemName: "play")
                      .resizable()
                      .scaledToFit()
                      .foregroundColor(.white)
                      .frame(width: 50, height: 50)
                )
                
              }
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading, spacing: 10) {
              Text(self.viewModel.repository.talk.title)
                .customFont(name: Fonts.shabnam, style: .title3, weight: .bold)
                .foregroundColor(Colors.primaryDarkGray)
              Text(self.viewModel.repository.talk.speakers.map { $0.title }.joined(separator: ", "))
                .customFont(name: Fonts.shabnamBold, style: .subheadline)
                .foregroundColor(.secondary)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
              Text("Description")
                .foregroundColor(.secondary)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                  .foregroundColor(Colors.primaryRed), alignment: .bottom)
              Text(self.viewModel.repository.talk.description ?? "")
                .foregroundColor(.secondary)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
              Text("Suggested Talks")
                .foregroundColor(.secondary)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                  .foregroundColor(Colors.primaryRed), alignment: .bottom)
              TalksRow(talks: self.viewModel.repository.suggestedTalk)
            }
            .padding()
            
          } // VStack
          if self.viewModel.statusView == .error {
            Text(self.viewModel.errorMessage)
              .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
          }
        } // ZStack
          .frame(maxWidth: .infinity)
      } // ScrollView
      
    } // GeometryReader
      .navigationBarTitle(Text(self.viewModel.repository.talk.speakers.map { $0.title }.joined(separator: ", ")))
      .onAppear {
        self.viewModel.setup(withId: Int(self.id) ?? 0)
    }
  }
}

struct TalkDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TalkDetailView(id: "0")
  }
}
