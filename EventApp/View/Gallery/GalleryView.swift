//
//  GalleryView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct GalleryView: View {
    
    var viewModel: AlbumViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if self.viewModel.statusView == .complete {
                    if self.viewModel.repositories.count != 0 {
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(viewModel.repositories, id: \.self) { album in
                                NavigationLink(destination: GalleryDetailView(album: album)) {
                                    GalleryCardView(album: album)
                                }
                            }
                            .padding()
                        }
                    } else {
                        EmptyListView()
                            .onTapGesture {
                                self.viewModel.setup()
                            }
                    }
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
            .navigationBarTitle(Text("Gallery".localized()), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(viewModel: AlbumViewModel())
    }
}
