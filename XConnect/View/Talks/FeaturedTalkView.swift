//
//  FeaturedTalkView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct FeaturedTalkView: View {
    
    @State var talk: Talk
    
    var body: some View {
        NavigationLink(destination: TalkDetailView(id: talk.id)) {
            ZStack {
                
                KFImage(URL(string: Images.urlExtension + (talk.section.image)))
                    .placeholder {
                        ImagePlaceholder()
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct FeaturedTalkView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTalkView(talk: Talk.example)
    }
}
