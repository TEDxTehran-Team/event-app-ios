//
//  Constants.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/29/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

enum Constants {
  static let baseUrl = "https://tedxtehran.idearun.co/graphql/"
  static let placeholderUrl = "https://tedxtehran.com/"
}

enum Fonts {
  static let shabnam = "Shabnam-FD"
  static let shabnamBold = "Shabnam-Bold-FD"
}

enum Colors {
  static let primaryRed = Color("primaryRed")
  static let primaryBackground = Color("primaryBackground")
  static let primaryLightGray = Color("primaryLightGray")
}

enum Images {
  static let urlExtension = "https://tedxtehran.idearun.co/media/"
  static let logo = "tedx-logo"
  static let placeholder = "placeholder"
  static let profilePlaceholder = "profile-placeholder"
  
  enum Examples {
    static let map = "map_image_test"
    static let about = "about_image_test"
    static let eventBanner = "about_image_test"
    static let galleryCover = "gallery_cover_test"
    static let galleryPhoto = "gallery_photo_test"
  }
}
