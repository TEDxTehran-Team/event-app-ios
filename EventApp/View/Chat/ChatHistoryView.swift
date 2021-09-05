//
//  MyChat.swift
//  EventApp
//
//  Created by ali on 4/16/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ChatHistoryView: View {
    
    let profiles = [ProfileData.example, ProfileData.example, ProfileData.example, ProfileData.example, ProfileData.example, ProfileData.example, ProfileData.example]
    let chatHitory = ChatHistory.exampleList
    
    var body: some View {
        VStack {
            ChatHistoryTitleView(title: "شروع گفتگوی جدید")
            Divider()
            ChatHistoryProfileHorizontalList(profiles: profiles)
            Divider()
            ChatHistoryTitleView(title: "آخرین گفتگو های شما")
            Divider()
            ChatHistoryVerticalChatList(chats: chatHitory)
        }
    }
}

struct ChatHistoryVerticalChatList: View {
    var chats: [ChatHistory]
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(chats, id: \.self) { chat in
                        ChatHistoryChatCell(chat: chat)
                            .padding(.trailing)
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 0, maxHeight: .infinity)
    }
}

struct ChatHistoryChatCell: View {
    var chat: ChatHistory
    let height = UIScreen.main.bounds.width / 6
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                LocalizedNumberText("\(chat.newMessages)")
                    .font(.body)
                LocalizedNumberText("\(chat.lastMessage.time)")
                    .font(.footnote)
            }
            .frame(width: height, height: height)
            Spacer()
            VStack(alignment: .trailing) {
                Text(chat.firstName + " " + chat.lastName)
                    .font(.body)
                LocalizedNumberText(chat.lastMessage.messageText)
                    .font(.footnote)
                    .lineLimit(1)
            }
            KFImage(URL(string: chat.image))
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .scaledToFill()
                .frame(width: height, height: height)
                .clipShape(Circle())
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct ChatHistoryProfileHorizontalList: View {
    let height =  10 + UIScreen.main.bounds.width / 4
    var profiles: [ProfileData]
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(profiles, id: \.self) { profile in
                        ChatHistoryCell(profile: profile)
                            .padding(.horizontal, 5)
                    }
                    ChatHistoryCell(profile: ProfileData.example)
                }
                .padding(.horizontal)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: height)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: height)
    }
}

struct ChatHistoryCell: View {
    var profile: ProfileData
    let width = UIScreen.main.bounds.width / 6
    var body: some View {
        VStack {
            KFImage(URL(string: profile.image ?? ""))
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipShape(Circle())
            Text((profile.firstName ?? "") + " " + (profile.lastName ?? ""))
                .font(.body)
            Text(profile.jobTitle ?? "")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(width: width, height: width + 50, alignment: .center) // 50 is two text height
    }
}

struct ChatHistoryTitleView: View {
    var title: String
    var body: some View {
        HStack() {
            Spacer()
            Text(title)
                .padding(.trailing)
        }
        .frame(minHeight: 0, maxHeight: 30)
    }
}

struct ChatHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHistoryView()
    }
}
