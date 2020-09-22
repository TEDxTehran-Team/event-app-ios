//
//  SettingsView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/22/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  
  @EnvironmentObject var iconSettings: IconNames
  @ObservedObject private var toggleModel = ToggleModel()
  @State private var showingAlert = false
  @State private var alertTitle = ""
  @State private var alertMessage = ""
  
  var body: some View {
    
    Form {
      Section(header: Text("Appearance")) {
        
        Picker(selection: $iconSettings.currentIndex, label: Text("Icons")) {
          ForEach(0..<iconSettings.iconNames.count) { i in
            HStack {
              Text(self.iconSettings.iconNames[i] ?? "AppIcon")
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
      
      Section(header: Text("More")) {
        Button(action: {
          Network.shared.apollo.clearCache() { result in
            switch result {
              case .success():
                self.alertTitle = "Done"
                self.alertMessage = "Cache cleared successfully"
              case .failure(let error):
                self.alertTitle = "Error occurred"
                self.alertMessage = error.localizedDescription
            }
            self.showingAlert = true
          }
        }) {
          HStack(spacing: 10) {
            Image(systemName: "paintbrush")
            Text("Clear Cache")
          }
        }
        
        Button(action: {
          UIApplication.shared.open(URL(string: Constants.acknowledgmentsUrl)!)
        }) {
          HStack(spacing: 10) {
            Image(systemName: "heart")
            Text("Acknowledgments")
          }
        }
      }
      
    }
    .navigationBarTitle(Text("Settings"), displayMode: .inline)
    .alert(isPresented: $showingAlert) {
      Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
    }
    
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
