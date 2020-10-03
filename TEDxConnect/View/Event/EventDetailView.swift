//
//  EventDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct EventDetailView: View {
  
  @EnvironmentObject var viewModel: EventViewModel
  
  var body: some View {
    GeometryReader { fullView in
      ScrollView(.vertical) {
        ZStack {
          VStack {

            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.banner ?? ""))!)
              .placeholder {
                ImagePlaceholder()
              }
              .resizable()
              .scaledToFill()
              .frame(width: fullView.size.width, height: 200)
              .clipped()
            
            Button(action: {
              UIApplication.shared.open(URL(string: self.viewModel.repository.links?.first { $0.role == "LIVE" }?.url ?? Constants.placeholderUrl)!)
              
            }) {
              HStack {
                Spacer()
                Image(systemName: "play.rectangle")
                Text(LocalizedStringKey("Watch Live"))
                Spacer()
              }
              .padding()
            }
            .customStyle(withBackgroundColor: Colors.primaryRed)
            
            VStack(alignment: .leading) {
              if let ticket = self.viewModel.repository.links?.first { $0.role == "TICKET" } {
                Button {
                  UIApplication.shared.open(URL(string: ticket.url )!)
                } label: {
                  HStack {
                    Image(decorative: "ticket-icon")
                    Text(LocalizedStringKey("Buy Ticket"))
                  }
                  .padding()
                }
                Divider()
              }
              if let registeration = self.viewModel.repository.links?.first { $0.role == "REGISTRATION" } {
                Button {
                  UIApplication.shared.open(URL(string: registeration.url )!)
                } label: {
                  HStack {
                    Image(decorative: "register-icon")
                    Text(LocalizedStringKey("Register in Event"))
                  }
                  .padding()
                }
                Divider()
              }
              NavigationLink(destination: SpeakersView()) {
                HStack {
                  Image(decorative: "speaker-icon")
                  Text(LocalizedStringKey("Speakers"))
                }
                .padding()
              }
              Divider()
              HStack {
                Image(decorative: "clock-icon")
                Text(DateHelper.dateWith(self.viewModel.repository.startDate ?? "TBA", showTime: true))
                Text(DateHelper.dateWith(self.viewModel.repository.endDate  ?? "TBA", showTime: true))
              }
              .padding()
              Divider()
              HStack {
                Image(decorative: "venue-icon")
                Text(self.viewModel.repository.venue?.title ?? "-")
              }
              .padding()
              Divider()
              HStack {
                Image(decorative: "address-icon")
                Text(self.viewModel.repository.venue?.adress ?? "-")
              }
              .padding()
            }
            .background(Colors.primaryBackground)
            .cornerRadius(10)
            .foregroundColor(.secondary)
            .padding([.horizontal, .bottom])
            
            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.venue?.mapImage ?? ""))!)
              .placeholder {
                ImagePlaceholder()
              }
              .resizable()
              .scaledToFill()
              .frame(width: fullView.size.width, height: 200)
              .onTapGesture {
                UIApplication.shared.open(URL(string: self.viewModel.repository.venue?.mapLink ?? Constants.placeholderUrl)!)
              }
            
            NavigationLink(destination: SponsorsView()) {
              HStack {
                Spacer()
                Text(LocalizedStringKey("Sponsors"))
                Spacer()
              }
              .padding()
              .customStyle(withBackgroundColor: Colors.primaryRed)
            }

          } // VStack
          if self.viewModel.statusView == .error {
            ErrorView(errorText: self.viewModel.errorMessage)
              .onTapGesture {
                self.viewModel.setup()
              }
          }
        } // ZStack
        
      } // ScrollView
      .background(Colors.primaryLightGray)
      
    } // GeometryReader
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text(LocalizedStringKey("Home")), displayMode: .inline)
    .navigationBarItems(leading: NavigationLink(destination: SettingsView().environmentObject(IconNames()), label: {
      Image(systemName: "gear")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
    }), trailing: NavigationLink(destination: AboutView(), label: {
      Image(systemName: "info.circle")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
    }))
    .environment(\.layoutDirection, .rightToLeft)
  } // Body
  
  
  
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView().environmentObject(EventViewModel())
  }
}
