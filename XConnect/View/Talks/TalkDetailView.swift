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
    
    @State private var titleLocalizedKey = ""
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                if self.viewModel.statusView == .complete {
                    self.content
                }
                if self.viewModel.statusView == .error {
                    ErrorView(errorText: self.viewModel.errorMessage)
                        .onTapGesture {
                            self.viewModel.setup(withId: Int(self.id) ?? 0)
                        }
                }
                
                if self.viewModel.statusView == .loading {
                    Indicator()
                }
                
            } // ZStack
            .frame(maxWidth: .infinity)
        } // ScrollView
        
        .navigationBarTitle(Text(self.viewModel.repository.talk.speakers.map { $0.title }.joined(separator: ", ")))
        .onAppear {
            self.viewModel.setup(withId: Int(self.id) ?? 0)
        }
    }
    
    private var content : some View {
        VStack(alignment: .trailing) {
            Button(action: {
                if let  url = URL(string: viewModel.repository.talk.videoLink ?? Constants.placeholderUrl){
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
                
            }) {
                ZStack {
                    
                    KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.talk.section.image)))
                        .placeholder {
                            ImagePlaceholder()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .clipped()
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.35))
                        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
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
            
            VStack(alignment: .trailing, spacing: 10) {
                Text(self.viewModel.repository.talk.title)
                    .customFont(name: Fonts.shabnam, style: .title3, weight: .bold)
                    .foregroundColor(Colors.primaryDarkGray)
                    .multilineTextAlignment(.trailing)
                Text(self.viewModel.repository.talk.speakers.map { $0.title }.joined(separator: ", "))
                    .customFont(name: Fonts.shabnamBold, style: .subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            VStack(alignment: .trailing, spacing: 10) {
                Text(LocalizedStringKey("Description"))
                    .foregroundColor(.secondary)
                    .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                                .foregroundColor(Colors.primaryRed), alignment: .bottom)
                    .customFont(name: Fonts.shabnam, style: .body)
                Text(self.viewModel.repository.talk.description ?? "")
                    .foregroundColor(.secondary)
                    .customFont(name: Fonts.shabnamBold, style: .body)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            VStack(spacing: 10) {
                HStack {
                    
                    Text(LocalizedStringKey("Related Talks"))
                        .foregroundColor(.secondary)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom)
                                    .foregroundColor(Colors.primaryRed), alignment: .bottom)
                        .padding(.horizontal)
                        .customFont(name: Fonts.shabnam, style: .body)
                    
                    Spacer()
                }
                
                TalksRow(talks: self.viewModel.repository.suggestedTalks)
                    .padding(.top)
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                
            }
            .environment(\.layoutDirection, .rightToLeft)
            .buttonStyle(PlainButtonStyle())
            .layoutPriority(1)
            
        } // VStack
    }
}

struct TalkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TalkDetailView(id: "0")
    }
}
