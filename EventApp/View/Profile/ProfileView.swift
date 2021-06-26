//
//  ProfileView.swift
//  EventApp
//
//  Created by ali on 4/14/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var userId: String
    var leadingTrailingPadding: CGFloat = 40
    var isMyProfile: Bool = true
    
    init(isMyProfile: Bool, userId: String) {
        self.userId = userId
        self.isMyProfile = isMyProfile
    }
    
    
    var body: some View {
        //        if self.viewModel.statusView == .complete {
        ScrollView {
            VStack {
                
                topView
                    .scaledToFit()
                
                
                Text(viewModel.repositories.firstName + " " +  viewModel.repositories.lastName )
                    .customFont(name: Configuration.shabnamBold, style: .title2, weight: .bold)
                    .padding(.bottom, 20)
                
                interstsList
                    .padding(.top, 5)
                    .padding([.leading, .trailing], leadingTrailingPadding)
                
                
                jobView
                
                fieldView
                
                HStack {
                    Text(LocalizedStringKey("My Story"))
                        .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
                    
                    Spacer()
                }
                .padding(.top, 5)
                .padding([.leading, .trailing], 40)
                
                Text(viewModel.repositories.story)
                    .customFont(name: Configuration.shabnam, style: .subheadline, weight: .regular)
                    .padding(.top, 5)
                    .padding([.leading, .trailing], leadingTrailingPadding)
                
                
                HStack(alignment: .center) {
                    phoneNumberView
                        .padding(.trailing, 20)
                    
                    emailView
                }
                .padding(.top, 15)
                .padding(.bottom, 30)
                
                Button(action: {
                    
                }, label: {
                    if isMyProfile {
                        updateProfileButton
                    } else {
                        chatButton
                    }
                })
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        //        }
        
        
        //        if self.viewModel.statusView == .loading {
        //            Indicator()
        //        }
        //
        //        if self.viewModel.statusView == .error {
        //            ErrorView(errorText: self.viewModel.errorMessage)
        //                .onTapGesture {
        //                    self.viewModel.setup(withUserId: userId)
        //                }
        //        }
    }
}

extension ProfileView {
    private var topView: some View {
        ZStack {
            Image("person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2, alignment: .top)
                .background(Color.blue)
                .cornerRadius(7)
                .padding(.top, 10)
            
            Image("Profile Background Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .top)
        }
    }
    
    private var updateProfileButton: some View {
        Text(LocalizedStringKey("Update Profile"))
            .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
            .frame(width: 290, height: 62, alignment: .center)
            .foregroundColor(Color.white)
            .background(Colors.primaryRed)
            .cornerRadius(5)
    }
    
    private var chatButton: some View {
        Text(LocalizedStringKey("").stringKey + " " + viewModel.repositories.firstName)
            .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
            .frame(width: 290, height: 62, alignment: .center)
            .foregroundColor(Color.white)
            .background(Colors.primaryRed)
            .cornerRadius(5)
    }
    
    private var emailView: some View {
        HStack {
            Image(systemName: "envelope")
                .foregroundColor(.black)
            Text(viewModel.repositories.email)
                .customFont(name: Configuration.shabnam, style: .subheadline, weight: .regular)
        }
    }
    
    private var phoneNumberView: some View {
        HStack {
            Image(systemName: "phone")
                .foregroundColor(.black)
            
            Text(viewModel.repositories.phoneNumber)
                .customFont(name: Configuration.shabnam, style: .subheadline, weight: .regular)
            
        }
    }
    
    private var jobView: some View {
        HStack {
            Text(LocalizedStringKey("Job Title").stringKey + ": ")
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
            
            Text(viewModel.repositories.jobTitle)
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .regular)
            Spacer()
        }
        .padding(.top, 5)
        .padding([.leading, .trailing], leadingTrailingPadding)
    }
    
    private var fieldView: some View {
        HStack {
            Text(LocalizedStringKey("Field").stringKey + ": ")
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
            
            Text(viewModel.repositories.field)
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .regular)
            Spacer()
        }
        .padding(.top, 5)
        .padding([.leading, .trailing], leadingTrailingPadding)
    }
    
    private var interstsList: some View {
            ForEach(0..<viewModel.repositories.interests.count, id:\.self) { i in
                Text("\(viewModel.repositories.interests[i].interest)")
                    .foregroundColor(.white)
                    .padding()
                    .lineLimit(1)
                    .frame(height: 36)
                    .background(Colors.primaryBlue)
                    .cornerRadius(18)
            }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isMyProfile: false, userId: "1")
            .previewDevice("iPhone 12 mini")
        ProfileView(isMyProfile: true, userId: "1")
    }
}
