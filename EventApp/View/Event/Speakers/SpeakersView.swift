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
    
    @ObservedObject var viewModel:SpeakerViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                if self.viewModel.statusView == .loading {
                    Indicator()
                }else if self.viewModel.statusView == .error {
                    ErrorView(errorText: self.viewModel.errorMessage)
                        .onTapGesture {
                            self.viewModel.setup()
                        }
                }else {
                    ForEach(self.viewModel.repositories, id: \.self){ item in
                        NavigationLink(destination: SpeakerDetailView(speaker: item)) {
                            HStack {
                                VStack() {
                                    Spacer()
                                    Text(item.title)
                                        .customFont(name: Configuration.shabnamBold, style: .callout, weight: .bold)
                                        .lineLimit(2)
                                    Spacer()
                                    Text(item.description)
                                        .multilineTextAlignment(.center)
                                        .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                                        .lineLimit(2)
                                    Spacer()
                                }
                                Spacer()
                                KFImage(URL(string: Images.urlExtension + item.image))
                                    .placeholder {
                                        ImagePlaceholder()
                                    }
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                
                            }
                            .padding(.vertical,6)
                            .padding(.horizontal)
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle(Text(LocalizedStringKey("Speakers")), displayMode: .inline)
        }
        
    }
}

struct SpeakersView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakersView(viewModel:SpeakerViewModel())
    }
}
