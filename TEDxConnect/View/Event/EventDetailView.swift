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
            
            
        } // ScrollView
        .background(Colors.primaryLightGray)
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
    
    private var mainContent : some View {
        VStack {
            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.banner ?? ""))!)
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)
                .frame(height: 200)
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity)
                .padding()
            
            
            Button(action: {
                if let url = URL(string: viewModel.repository.links?.first { $0.role == "LIVE" }?.url ?? Constants.placeholderUrl) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }) {
                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "play.rectangle")
                    Text(LocalizedStringKey("Watch Live"))
                        .customFont(name: Fonts.shabnam, style: .body, weight: .bold)
                    Spacer()
                }
                .padding(.vertical)
            }
            .customStyle(withBackgroundColor: Colors.primaryRed)
            
            VStack(alignment: .leading) {
                if let ticket = self.viewModel.repository.links?.first { $0.role == "TICKET" } {
                    Button {
                        if let url = URL(string: ticket.url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    } label: {
                        HStack {
                            Image(decorative: "ticket-icon")
                            Text(LocalizedStringKey("Buy Ticket"))
                                .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                        }
                        .padding(.vertical)
                    }
                    .foregroundColor(Colors.primaryRed)
                    Divider()
                }
                if let registeration = self.viewModel.repository.links?.first { $0.role == "REGISTRATION" } {
                    Button {
                        if let urlMap = URL(string: registeration.url) {
                            UIApplication.shared.open(urlMap, options: [:], completionHandler: nil)
                        }
                    } label: {
                        HStack {
                            Image(decorative: "register-icon")
                            Text(LocalizedStringKey("Register in Event"))
                                .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                        }
                        .padding(.vertical)
                    }
                    .foregroundColor(Colors.primaryRed)
                    Divider()
                }
                
                HStack {
                    Image(decorative: "clock-icon")
                    Text(DateHelper.dateWith(self.viewModel.repository.startDate ?? "TBA", showTime: true))
                        .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                    Text(DateHelper.dateWith(self.viewModel.repository.endDate  ?? "TBA", showTime: true))
                        .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                }
                .padding()
                Divider()
                HStack {
                    Image(decorative: "venue-icon")
                    Text(self.viewModel.repository.venue?.title ?? "-")
                        .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                }
                .padding()
                Divider()
                HStack {
                    Image(decorative: "address-icon")
                    Text(self.viewModel.repository.venue?.address ?? "-")
                        .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                }
                .padding()
            }
            .background(Colors.primaryBackground)
            .cornerRadius(10)
            .foregroundColor(.secondary)
            .padding([.vertical, .bottom])
            
            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.venue?.mapImage ?? ""))!)
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .onTapGesture {
                    if let url = URL(string: viewModel.repository.venue?.mapLink ?? Constants.placeholderUrl) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    
                }
                .padding(.bottom)
            
            NavigationLink(destination: SponsorsView(eventId: viewModel.repository.id)) {
                HStack {
                    Spacer()
                    Text(LocalizedStringKey("Sponsors"))
                        .customFont(name: Fonts.shabnam, style: .body, weight: .bold)
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
        EventDetailView().environmentObject(EventViewModel())
    }
}
