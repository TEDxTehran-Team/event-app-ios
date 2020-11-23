//
//  AboutView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct AboutView: View {
    
    @ObservedObject var aboutViewModel = AboutViewModel()
    
    
    var body: some View {
            ZStack {
                ScrollView {
                    VStack {
                        if TimeZone.current.isMasterData {
                            Image(Images.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .padding(20)
                        }
                        ForEach(aboutViewModel.repositories,id: \.self) { about in
                            VStack {
                                
                                KFImage(URL(string: Images.urlExtension + (about.image ?? "")))
                                    .placeholder {
                                        ImagePlaceholder()
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                
                                Text(about.description)
                                    .padding()
                                    .customFont(name: Fonts.shabnam, style: .body)
                                    .multilineTextAlignment(.trailing)
                                Spacer()
                            }
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(Colors.primaryBackground)
                                            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 3))
                            .padding(.horizontal)
                            .padding(.vertical,5)
                        }
                        Spacer()
                    }
                }
                
                
                if self.aboutViewModel.statusView == .emptyState {
                    EmptyListView()
                        .onTapGesture {
                            self.aboutViewModel.setup()
                        }
                }
                
                if self.aboutViewModel.statusView == .loading {
                    Indicator()
                }
                
                if self.aboutViewModel.statusView == .error {
                    ErrorView(errorText: self.aboutViewModel.errorMessage)
                        .onTapGesture {
                            self.aboutViewModel.setup()
                        }
                }
            }
            .onAppear(perform: {
                if self.aboutViewModel.statusView == .none {
                    self.aboutViewModel.setup()
                }
            })
        
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
