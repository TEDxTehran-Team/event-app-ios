//
//  NotificationService.swift
//  TEDxConnectNotificationServiceExtension
//
//  Created by Tadeh Alexani on 11/14/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import UserNotifications
import Pushe

class NotificationService: UNNotificationServiceExtension {
  
  var contentHandler: ((UNNotificationContent) -> Void)?
  var bestAttemptContent: UNMutableNotificationContent?
  
  override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
    self.contentHandler = contentHandler
    self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
    
    if let bestAttemptContent = self.bestAttemptContent {
      PusheClient.shared.didReceiveNotificationExtensionRequest(mutableContent: bestAttemptContent, contentHandler: contentHandler)
    }
  }
  
  override func serviceExtensionTimeWillExpire() {
    if let contentHandler = self.contentHandler, let bestAttemptContent =  self.bestAttemptContent {
      contentHandler(bestAttemptContent)
    }
  }
}
