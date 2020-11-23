//
//  AboutView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
   @ObservedObject var aboutViewModel = AboutViewModel()
   @Environment(\.presentationMode) var presentation

    
    init() {
        print("initnitnt")
    }
    
    var body: some View {
      NavigationView {
        ZStack {
            VStack {
                if TimeZone.current.isMasterData {
                    Image(Images.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(20)
                }
                ForEach(aboutViewModel.repositories,id: \.self) { about in
                    NavigationLink(destination: AboutDetailView(item: about)) {
                        Text(about.title)
                            .padding()
                    }
                    .isDetailLink(false)
                }
                Spacer()
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
        .navigationBarTitle(Text("About"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
          presentation.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "xmark")
        }))
      }
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
