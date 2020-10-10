//
//  EventDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage
import Sentry

struct EventDetailView: View {
  
  @EnvironmentObject var viewModel: EventViewModel
  @State private var showingSheet = false
  @State private var url = ""
  @State private var titleLocalizedKey = ""
  
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
              url = viewModel.repository.links?.first { $0.role == "LIVE" }?.url ?? Constants.placeholderUrl
              titleLocalizedKey = "Watch Live"
              showingSheet = true
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
                  url = ticket.url
                  titleLocalizedKey = "Buy Ticket"
                  showingSheet = true
                } label: {
                  HStack {
                    Image(decorative: "ticket-icon")
                    Text(LocalizedStringKey("Buy Ticket"))
                  }
                  .padding()
                }
                .foregroundColor(Colors.primaryRed)
                Divider()
              }
              if let registeration = self.viewModel.repository.links?.first { $0.role == "REGISTRATION" } {
                Button {
                  url = registeration.url
                  titleLocalizedKey = "Register in Event"
                  showingSheet = true
                } label: {
                  HStack {
                    Image(decorative: "register-icon")
                    Text(LocalizedStringKey("Register in Event"))
                  }
                  .padding()
                }
                .foregroundColor(Colors.primaryRed)
                Divider()
              }
              NavigationLink(destination: SpeakersView()) {
                HStack {
                  Image(decorative: "speaker-icon")
                  Text(LocalizedStringKey("Speakers"))
                }
                .padding()
              }
              .foregroundColor(Colors.primaryRed)
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
                Text(self.viewModel.repository.venue?.address ?? "-")
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
                url = viewModel.repository.venue?.mapLink ?? Constants.placeholderUrl
                titleLocalizedKey = ""
                showingSheet = true
              }
            
            NavigationLink(destination: SponsorsView(eventId: viewModel.repository.id ?? 1)) {
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
    .sheet(isPresented: $showingSheet) {
      WebViewSheet(url: url, titleLocalizedKey: titleLocalizedKey)
    }
  } // Body
  
  
  
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView().environmentObject(EventViewModel())
  }
}
