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
    
    @ObservedObject var viewModel: EventViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                if self.viewModel.statusView == .error {
                    ErrorView(errorText: self.viewModel.errorMessage)
                        .onTapGesture {
                            self.viewModel.setup()
                        }
                }else {
                    self.mainContent
                }
            }
            
        }
        .background(Colors.primaryLightGray)
        .environment(\.layoutDirection, Configuration.direction)
        
    }
    
    private var mainContent : some View {
        VStack {
            KFImage(URL(string: Images.urlExtension + (self.viewModel.event.banner ?? ""))!)
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(height: 200)
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                .padding()
            
            if !self.viewModel.event.liveUrl.isEmpty {
                Button(action: {
                    if let url = URL(string: viewModel.event.liveUrl) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }) {
                    HStack(alignment: .center) {
                        Spacer()
                        
                        Image(systemName: "play.rectangle")
                        
                        Text("Watch Live".localized())
                            .customFont(name: Configuration.shabnam, style: .body, weight: .bold)
                        
                        
                        Spacer()
                    }
                    
                    .padding(.vertical)
                }
                .customStyle(withBackgroundColor: Colors.primaryRed)
            }
            
            
            
            VStack(alignment: .leading) {
                if !self.viewModel.event.ticketUrl.isEmpty {
                    Button {
                        if let url = URL(string: self.viewModel.event.ticketUrl) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    } label: {
                        HStack {
                            
                            Image(decorative: "ticket-icon")
                            
                            Text("Buy Ticket".localized())
                                .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    .foregroundColor(Colors.primaryRed)
                    Divider()
                }
                if !self.viewModel.event.registerationUrl.isEmpty {
                    Button {
                        if let urlMap = URL(string: self.viewModel.event.registerationUrl) {
                            UIApplication.shared.open(urlMap, options: [:], completionHandler: nil)
                        }
                    } label: {
                        HStack {
                            Image(decorative: "register-icon")
                            
                            Text("Register in Event".localized())
                                .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    .foregroundColor(Colors.primaryRed)
                    Divider()
                }
                
                HStack {
                    Image(decorative: "clock-icon")
                    
                    
                    LocalizedNumberText(DateHelper.dateWith(self.viewModel.event.startDate ?? "TBA", showTime: true))
                        .customFont(name: Configuration.shabnam , style: .footnote, weight: .regular)
                    Text("|")
                    LocalizedNumberText(DateHelper.dateWith(self.viewModel.event.endDate  ?? "TBA", showTime: true))
                        .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                    
                    Spacer()
                    
                }
                
                .padding()
                Divider()
                HStack {
                    
                    
                    Image(decorative: "venue-icon")
                    
                    Text(self.viewModel.event.venue?.title ?? "-")
                        .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                    
                    Spacer()
                }
                .padding()
                Divider()
                HStack {
                    
                    
                    Image(decorative: "address-icon")
                    
                    LocalizedNumberText(self.viewModel.event.venue?.address ?? "-")
                        .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                        .multilineTextAlignment(.trailing)
                    
                    Spacer()
                }
                .padding()
            }
            .background(Colors.primaryBackground)
            .cornerRadius(10)
            .foregroundColor(.secondary)
            .padding([.vertical, .bottom])
            
            
            if !(self.viewModel.event.venue?.mapImage ?? "").isEmpty {
                KFImage(URL(string: Images.urlExtension + (self.viewModel.event.venue?.mapImage ?? ""))!)
                    .placeholder {
                        ImagePlaceholder()
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .onTapGesture {
                        if let url = URL(string: viewModel.event.venue?.mapLink ?? Configuration.placeholderUrl) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                        
                    }
                    .padding(.bottom)
            }
            
            
            NavigationLink(destination: SponsorsView(eventId: viewModel.event.id)) {
                HStack {
                    Spacer()
                    Text("Sponsors".localized())
                        .customFont(name: Configuration.shabnam, style: .body, weight: .bold)
                    Spacer()
                }
                .padding()
                .customStyle(withBackgroundColor: Colors.primaryRed)
            }
            
        } // VStack
        .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
        .padding(.horizontal)
    }
    
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(viewModel: EventViewModel())
    }
}
