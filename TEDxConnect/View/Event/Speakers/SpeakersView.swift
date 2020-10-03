//
//  SpeakersView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SpeakersView: View {
  
  @ObservedObject var viewModel = SpeakerViewModel()
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        GridStack(minCellWidth: (geo.size.width/3)-20, spacing: 15, numItems: viewModel.repositories.count) { index, cellWidth in
          NavigationLink(destination:
                          SpeakerDetailView(speaker: self.viewModel.repositories[index])
          ) {
            
            VStack {
              KFImage(URL(string: Images.urlExtension + self.viewModel.repositories[index].image)!)
                .placeholder {
                  ImagePlaceholder()
                }
                .resizable()
                .scaledToFill()
                .frame(width: cellWidth, height: cellWidth)
                .cornerRadius(10)
              
              Text(self.viewModel.repositories[index].title)
                .customFont(name: Fonts.shabnam, style: .headline)
                .lineLimit(2)
            }
            
          }
          .buttonStyle(PlainButtonStyle())
        }
        
        if self.viewModel.statusView == .loading {
          Indicator()
        }
        
        if self.viewModel.statusView == .error {
          ErrorView(errorText: self.viewModel.errorMessage)
            .onTapGesture {
              self.viewModel.setup()
            }
        }
      }
      .navigationBarTitle(Text(LocalizedStringKey("Speakers")), displayMode: .inline)
      .onAppear {
        self.viewModel.setup()
      }
    }
  }
}

struct SpeakersView_Previews: PreviewProvider {
  static var previews: some View {
    SpeakersView().environmentObject(SpeakerViewModel())
  }
}
