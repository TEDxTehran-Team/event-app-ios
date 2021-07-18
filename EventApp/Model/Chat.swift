//
//  Chat.swift
//  EventApp
//
//  Created by ali on 7/11/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Message: Codable, Hashable {
    var messageText: String
    var time: String
    
    static var exampleMessage1: Message {
        return Message(messageText: "برای لرن این مدل نیازمند دیتای بیشتری هستیم و نیازمند وقت و همت بسیار زیادی هست که مجمبورم این متنو طولانی تر کنم که یه حالتیو تست کنیم.", time: "2021/03/12-22:23:45")
    }
    
    static var exampleMessage2: Message {
        return Message(messageText: "سلام نام من مهدی است", time: "2021/04/12-02:23:45")
    }

}

struct ChatHistory: Decodable, Hashable {

    static func == (lhs: ChatHistory, rhs: ChatHistory) -> Bool {
        return lhs.id == lhs.id
    }
    
    var firstName: String
    var lastName: String
    var lastMessage: Message
    var id: String
    var newMessages: Int
    var image: String
  
  static var exampleList: [ChatHistory] {
    [
        ChatHistory(firstName: "مهدی", lastName: "درویشی", lastMessage: Message.exampleMessage2, id: "kkddhhkd", newMessages: 0, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
        ChatHistory(firstName: "احمد", lastName: "ترکاشوند", lastMessage: Message.exampleMessage1, id: "dofjfd", newMessages: 3, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
        ChatHistory(firstName: "یلدا", lastName: "سلطانی", lastMessage: Message.exampleMessage2, id: "ofjd", newMessages: 5, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
        ChatHistory(firstName: "علی", lastName: "جباری", lastMessage: Message.exampleMessage2, id: "dkd", newMessages: 0, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
        ChatHistory(firstName: "عباس", lastName: "مدنی", lastMessage: Message.exampleMessage1, id: "dkjffkdd", newMessages: 0, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
        ChatHistory(firstName: "طاده", lastName: "سالاری", lastMessage: Message.exampleMessage1, id: "fji", newMessages: 3, image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg" ),
    ]
  }
}
