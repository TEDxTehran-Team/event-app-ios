//
//  EventDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct EventDetailView: View {
  
  @ObservedObject var viewModel = EventViewModel()
  
  var body: some View {
    GeometryReader { geometry in
      
      ZStack {
        ScrollView(.vertical) {
          RemoteImage(type: .url(URL(string: Images.urlExtension + (self.viewModel.repository.banner ?? ""))!), errorView: { _ in
            ImagePlaceholder()
          }, imageView: { image in
            image
              .resizable()
              .scaledToFill()
              .frame(width: geometry.size.width, height: 200)
              .clipped()
          }, loadingView: {
            Indicator()
          })
          
          Button(action: {
            
            UIApplication.shared.open(URL(string: self.viewModel.repository.links?.first { $0.role == "ticket" }?.url ?? Constants.placeholderUrl)!)
            
          }) {
            HStack {
              Spacer()
              Image(systemName: "play.rectangle")
              Text("Watch Live")
              Spacer()
            }
            .padding()
          }
          .customStyle(withBackgroundColor: Colors.primaryRed)
          
          VStack {
            VStack(alignment: .leading) {
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
                Text(self.viewModel.repository.venue?.adddress ?? "-")
              }
              .padding()
            }
            .background(Colors.primaryBackground)
            .cornerRadius(10)
            .foregroundColor(.secondary)
            .padding([.horizontal, .bottom])
            
            RemoteImage(type: .url(URL(string: Images.urlExtension + (self.viewModel.repository.venue?.mapImage ?? ""))!), errorView: { _ in
              ImagePlaceholder()
            }, imageView: { image in
              image
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width, height: 200)
            }, loadingView: {
              Indicator()
            })
              .onTapGesture {
                UIApplication.shared.open(URL(string: self.viewModel.repository.venue?.mapLink ?? Constants.placeholderUrl)!)
            }
            
            
          }
        }
        .background(Colors.primaryLightGray)
        
        if self.viewModel.statusView == .error {
          Text(self.viewModel.errorMessage)
            .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
        }
        
      }
      
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Home"))
    .navigationBarItems(trailing: NavigationLink(destination: AboutView(), label: {
      Image(systemName: "info.circle")
        .foregroundColor(.white)
    }))
    .onAppear {
      UITableView.appearance().separatorStyle = .none
      self.viewModel.setup()
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  }
  
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView()
  }
}
