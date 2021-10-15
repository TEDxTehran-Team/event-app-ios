//
//  EditProfileView.swift
//  EventApp
//
//  Created by Alireza on 8/19/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct EditProfileView: View {
       
    var body: some View {
        VStack {
            HeaderView()
            BodyView()
            Spacer()
        }.onTapGesture {
            hideKeyboard()
        }
    }
    
    // MARK: - Header
    struct HeaderView: View {
        
        let imageHeight:CGFloat = UIScreen.main.bounds.width / 3
        var body: some View {
            VStack {
                LinearGradient(gradient: Gradient(colors: [.red, .red, .red.opacity(0.5)]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: imageHeight - 20)
                Image("person")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageHeight, height: imageHeight, alignment: .center)
                    .cornerRadius(10)
                    .padding(.top, -(imageHeight - 20))
                Text("برای استفاده از قسمت نتورکینگ نیازه که اطلاعات خودتون رو تکمیل کنید تا با فردی مشابه خود ارتباط برقرار کنید.")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 20)
                    .opacity(0.7)
            }
        }
    }
    
    // MARK: - Body
    struct BodyView: View {
                        
        var body: some View {
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Spacer()
                        Text("interests".localized())
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                    }
                    TagView(tags: ["aq", "bssds", "bcccccc","asd", "bssds", "bcsccccc"])
                    inputFields()
                    Button(action: {
                        // MARK: Button Action
                    }){
                        Text("confirm".localized())
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
        }
    }
    
    struct inputFields: View {
        
        @State var text = ""
                
        var body: some View {
            VStack(spacing: 15) {
                TextFieldWithImage(text: $text, placeholder: "name", imageName: "")
                TextFieldWithImage(text: $text, placeholder: "job title", imageName: "")
                TextFieldWithImage(text: $text, placeholder: "education", imageName: "")
                TextFieldWithImage(text: $text, placeholder: "phone number", imageName: "")
                TextFieldWithImage(text: $text, placeholder: "email", imageName: "")
                TextView() {
                    $0.text = "story".localized()
                }
                .font(.body)
                .frame(height: 100)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1)
                        .foregroundColor(.gray)
                )
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        EditProfileView()
    }
}
