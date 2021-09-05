//
//  AboutDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct AboutDetailView: View {
    
    @State var item: About
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                
                KFImage(URL(string: Images.urlExtension + (self.item.image ?? "")))
                    .placeholder {
                        ImagePlaceholder()
                    }
                    .resizable()
                    .scaledToFit()
                
                LocalizedNumberText(self.item.description)
                    .padding()
                Spacer()
            }
        }
        .navigationBarTitle(Text(self.item.title), displayMode: .inline)
    }
}

struct AboutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AboutDetailView(item: About.example)
    }
}
