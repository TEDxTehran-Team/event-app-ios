//
//  TalkDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct TalkDetailView: View {
  
  let id: String
  @ObservedObject var viewModel = TalkDetailViewModel()
  
  @State private var showingSheet = false
  @State private var url = ""
  @State private var titleLocalizedKey = ""
  
  var body: some View {
    GeometryReader { fullView in
      ScrollView(.vertical) {
        ZStack {
          VStack(alignment: .leading) {
            Button(action: {
              url = viewModel.repository.talk.videoLink ?? Constants.placeholderUrl
              showingSheet = true
            }) {
              ZStack {
                
                KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.talk.section.image))!)
                  .placeholder {
                    ImagePlaceholder()
                  }
                  .resizable()
                  .scaledToFill()
                  .frame(width: fullView.size.width, height: 200)
                  .clipped()
                
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
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
              Text(LocalizedStringKey("Description"))
                .foregroundColor(.secondary)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                          .foregroundColor(Colors.primaryRed), alignment: .bottom)
              Text(self.viewModel.repository.talk.description ?? "")
                .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            VStack(alignment: .leading, spacing: 10) {
              Text(LocalizedStringKey("Suggested Talks"))
                .foregroundColor(.secondary)
                .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                          .foregroundColor(Colors.primaryRed), alignment: .bottom)
                .padding(.horizontal)
              TalksRow(talks: self.viewModel.repository.suggestedTalk)
            }
            .layoutPriority(1)
            
          } // VStack
          if self.viewModel.statusView == .error {
            ErrorView(errorText: self.viewModel.errorMessage)
              .onTapGesture {
                self.viewModel.setup(withId: Int(self.id) ?? 0)
              }
          }
        } // ZStack
        .frame(maxWidth: .infinity)
      } // ScrollView
      
    } // GeometryReader
    .navigationBarTitle(Text(self.viewModel.repository.talk.speakers.map { $0.title }.joined(separator: ", ")))
    .onAppear {
      self.viewModel.setup(withId: Int(self.id) ?? 0)
    }
    .environment(\.layoutDirection, .rightToLeft)
    .sheet(isPresented: $showingSheet) {
      WebViewSheet(url: url, titleLocalizedKey: titleLocalizedKey)
    }
  }
}

struct TalkDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TalkDetailView(id: "0")
  }
}
