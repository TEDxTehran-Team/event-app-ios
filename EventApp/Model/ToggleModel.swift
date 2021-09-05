//
//  ToggleModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/22/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class ToggleModel: ObservableObject {
  @Published var isDark: Bool = (SceneDelegate.shared?.window?.traitCollection.userInterfaceStyle == .dark) {
    didSet {
      SceneDelegate.shared?.window!.overrideUserInterfaceStyle = isDark ? .dark : .light
    }
  }
}
