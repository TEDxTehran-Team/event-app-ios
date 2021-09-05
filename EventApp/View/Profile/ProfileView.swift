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
        GeometryReader { geo in
        //        if self.viewModel.statusView == .complete {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                    Color.gray
                        .frame(width: geo.size.width, height: 200)
                    
                    Image("person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width / 2, height: geo.size.width / 2, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(7)
                        .padding(.top, -1 * (geo.size.width / 4))
                
                
                Text(viewModel.firstName + " " + viewModel.lastName)
                    .customFont(name: Configuration.shabnamBold, style: .title2, weight: .bold)
                    .padding(.bottom, 20)
                
                interstsList
                    .padding(.vertical, 5)
                    .padding([.leading, .trailing], leadingTrailingPadding)
                
                jobView
                
                fieldView
                
                HStack {
                    Text("My Story".localized())
                        .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
                    Spacer()
                }
                .padding(.top, 5)
                .padding([.leading, .trailing], 40)
                
                LocalizedNumberText(viewModel.biography)
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
                        RoundButton("Update Profile".localized(), width: geo.size.width - 40, height: 62, alignment: .center)
                    } else {
                        RoundButton("Chat With".localized() + " " + viewModel.firstName, width: geo.size.width - 40, height: 62, alignment: .center)
                    }
                })
            }
            .frame(width: geo.size.width)
            .padding()
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
}

extension ProfileView {
    private var emailView: some View {
        HStack {
            Image(systemName: "envelope")
                .foregroundColor(.black)
            Text(viewModel.email)
                .customFont(name: Configuration.shabnam, style: .subheadline, weight: .regular)
        }
    }
    
    private var phoneNumberView: some View {
        HStack {
            Image(systemName: "phone")
                .foregroundColor(.black)
            
            LocalizedNumberText(viewModel.phoneNumber)
                .customFont(name: Configuration.shabnam, style: .subheadline, weight: .regular)
            
        }
    }
    
    private var jobView: some View {
        HStack {
            Text("Job Title".localized() + ": ")
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
            
            LocalizedNumberText(viewModel.jobTitle)
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .regular)
            Spacer()
        }
        .padding(.top, 5)
        .padding([.leading, .trailing], leadingTrailingPadding)
    }
    
    private var fieldView: some View {
        HStack {
            Text("Field".localized() + ": ")
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .bold)
            
            LocalizedNumberText(viewModel.educationField)
                .customFont(name: Configuration.shabnamBold, style: .headline, weight: .regular)
            Spacer()
        }
        .padding(.top, 5)
        .padding([.leading, .trailing], leadingTrailingPadding)
    }
    
    private var interstsList: some View {
        
        func generateContent(in g: GeometryProxy) -> some View {
            var width = CGFloat.zero
            var height = CGFloat.zero
            return ZStack(alignment: .topLeading) {
                ForEach(viewModel.interestList, id: \.self) { platform in
                    item(for: platform.name)
                        .padding(4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if (abs(width - d.width) > g.size.width) {
                                width = 0
                                height -= d.height
                            }
                            let result = width
                            if platform == viewModel.interestList.last! {
                                width = 0 //last item
                            } else {
                                width -= d.width
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: {d in
                            let result = height
                            if platform == viewModel.interestList.last! {
                                height = 0 // last item
                            }
                            return result
                        })
                }
            }
        }
        
        func item(for text: String) -> some View {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .lineLimit(1)
                .frame(height: 36)
                .background(Colors.primaryBlue)
                .cornerRadius(18)
        }
        
        return VStack {
            let sectionHeight = CGFloat(viewModel.repositories.interests?.compactMap({$0.name}).joined().count ?? 0) * 2
            GeometryReader { geometry in
                generateContent(in: geometry)
            }.frame(height: sectionHeight)
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
