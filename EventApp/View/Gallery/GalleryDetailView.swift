//
//  GalleryDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct GalleryDetailView: View {
    
    @ObservedObject var viewModel = PhotoViewModel()
    
    @State var album: Album
    
    var body: some View {
        ZStack {
            GridStack(minCellWidth: (UIScreen.main.bounds.width/3) - 20, spacing: 15, numItems: viewModel.repositories.count) { index, cellWidth in
                NavigationLink(destination:
                                KFImage(URL(string: Images.urlExtension + self.viewModel.repositories[index].thumbnail)!)
                                .placeholder {
                                    ImagePlaceholder()
                                }
                                .resizable()
                                .scaledToFit()
                ) {
                    
                    KFImage(URL(string: Images.urlExtension + self.viewModel.repositories[index].thumbnail)!)
                        .placeholder {
                            ImagePlaceholder()
                        }
                        .resizable()
                        .scaledToFill()
                        .frame(width: cellWidth, height: cellWidth)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            if self.viewModel.repositories.isEmpty && self.viewModel.statusView != .loading  {
                EmptyListView()
            }
            
            if self.viewModel.statusView == .loading {
                Indicator()
            }
            
            if self.viewModel.statusView == .error {
                ErrorView(errorText: self.viewModel.errorMessage)
                    .onTapGesture {
                        self.viewModel.setup(withAlbumId: Int(self.album.id) ?? 0)
                    }
            }
        }
        .navigationBarTitle(Text(album.title), displayMode: .inline)
        .onAppear {
            self.viewModel.setup(withAlbumId: Int(self.album.id) ?? 0)
        }
    }
    
}

struct GalleryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryDetailView(album: Album.example)
    }
}
