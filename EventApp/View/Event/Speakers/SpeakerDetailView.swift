//
//  SpeakerDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SpeakerDetailView: View {
    
    let speaker: Speaker
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                
                KFImage(URL(string: Images.urlExtension + (self.speaker.image)))
                    .placeholder {
                        ImagePlaceholder()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                
                LocalizedText(self.speaker.description)
                    .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                    .padding()
            }
            
        }
        .navigationBarTitle(Text(self.speaker.title), displayMode: .inline)
    }
}

struct SpeakerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerDetailView(speaker: Speaker.example)
    }
}
