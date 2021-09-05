//
//  SettingsView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/22/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var iconSettings: IconNames
    @ObservedObject private var toggleModel = ToggleModel()
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var showingSheet = false
    @State private var url = ""
    @State private var titleLocalizedKey = ""
    
    var body: some View {
        
        Form {
            Section(header: Text("Appearance".localized()).customFont(name: Configuration.shabnam, style: .footnote)) {
                
                Picker(selection: $iconSettings.currentIndex, label: Text("Icons".localized())) {
                    ForEach(0..<iconSettings.iconNames.count) { i in
                        HStack {
                            LocalizedNumberText(self.iconSettings.iconNames[i] ?? "AppIcon")
                            Spacer()
                            Image(uiImage: UIImage(named: self.iconSettings.iconNames[i] ?? "AppIcon") ?? UIImage())
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 50, height: 50, alignment: .leading)
                                .cornerRadius(11.185)
                        }
                    }
                }
                .onReceive([self.iconSettings.currentIndex].publisher.first()) { value in
                    
                    let i = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                    
                    if value != i {
                        UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                            if error != nil {
                                self.alertTitle = "Error occurred"
                                self.alertMessage = error?.localizedDescription ?? ""
                                self.showingAlert = true
                            }
                        }
                    }
                }
                
                
                Toggle(isOn: $toggleModel.isDark) {
                    Text("Dark Mode")
                }
                
            }
            
            Section(header: Text("More".localized()).customFont(name: Configuration.shabnam, style: .footnote), footer: Text("We're tracking potential bugs with Sentry and will fix all of them ASAP.".localized()).customFont(name: Configuration.shabnam, style: .footnote)) {
                Button(action: {
                    Network.shared.apollo.clearCache() { result in
                        switch result {
                        case .success():
                            self.alertTitle = "Done".localized()
                            self.alertMessage = "Cache cleared successfully".localized()
                        case .failure(let error):
                            self.alertTitle = "Error occurred".localized()
                            self.alertMessage = error.localizedDescription
                        }
                        self.showingAlert = true
                    }
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "paintbrush")
                        Text("Clear Cache".localized())
                    }
                }
                
                Button(action: {
                    if let url = URL(string: Configuration.acknowledgmentsUrl) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "heart")
                        Text("Acknowledgments".localized())
                    }
                }
            }
            
        }
        .navigationBarTitle(Text("Settings".localized()), displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK".localized())))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(iconSettings: IconNames())
    }
}
