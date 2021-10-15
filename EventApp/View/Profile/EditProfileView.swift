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
            ScrollView {
                VStack {
                    Text("علاقه‌مندی‌ها")
                }
            }
        }
    }
    
//    private var interstsList: some View {
//        let interestList = [InterestType.shortExample, .longExample]
//        func generateContent(in g: GeometryProxy) -> some View {
//            var width = CGFloat.zero
//            var height = CGFloat.zero
//            return ZStack(alignment: .topLeading) {
//                ForEach(interestList, id: \.self) { platform in
//                    item(for: platform.name)
//                        .padding(4)
//                        .alignmentGuide(.leading, computeValue: { d in
//                            if (abs(width - d.width) > g.size.width) {
//                                width = 0
//                                height -= d.height
//                            }
//                            let result = width
//                            if platform == interestList.last! {
//                                width = 0 //last item
//                            } else {
//                                width -= d.width
//                            }
//                            return result
//                        })
//                        .alignmentGuide(.top, computeValue: {d in
//                            let result = height
//                            if platform == interestList.last! {
//                                height = 0 // last item
//                            }
//                            return result
//                        })
//                }
//            }
//        }
//    }
    
    private func item(for text: String) -> some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .lineLimit(1)
            .frame(height: 36)
            .background(Colors.primaryBlue)
            .cornerRadius(18)
    }
}


struct EditProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        EditProfileView()
    }
}
