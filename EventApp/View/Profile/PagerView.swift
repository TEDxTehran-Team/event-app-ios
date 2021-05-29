//
//  PagerView.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI


extension HorizontalAlignment {
    private enum UnderlineLeading: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.leading]
        }
    }
    
    static let underlineLeading = HorizontalAlignment(UnderlineLeading.self)
}

struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat(0)
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    typealias Value = CGFloat
}

struct ScrollableTabView : View {
    
    @Binding var activeIdx: Int
    @State private var widthList: [CGFloat]
    private let dataSet: [LocalizedStringKey]
    init(activeIdx: Binding<Int>, dataSet: [LocalizedStringKey]) {
        self._activeIdx = activeIdx
        self.dataSet = dataSet
        _widthList = State.init(initialValue: [CGFloat](repeating: UIScreen.main.bounds.width/CGFloat(dataSet.count), count: dataSet.count))
    }
    
    var body: some View {
        GeometryReader { geo in
        VStack(alignment: .underlineLeading) {
            HStack {
                ForEach(0..<dataSet.count) { i in
                        Text(dataSet[i])
                            .customFont(name: Configuration.shabnam, style: .headline)
                            .foregroundColor(Color.black)
                            .modifier(ScrollableTabViewModifier(activeIdx: $activeIdx, idx: i))
                            .frame(width: geo.size.width / 2,  height: 25)
//                            .background(Rectangle().fill(Color.clear))
//                            .onPreferenceChange(WidthPreferenceKey.self, perform: { _ in
//                                self.widthList[i] = UIScreen.main.bounds.width
//                            })
                            .id(i)
                }
            }
            .padding(.horizontal, 5)
            HStack {
            Colors.primaryRed
                .clipShape(Rectangle(), style: FillStyle())
                .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                .frame(width: geo.size.width / 2,  height: 4)
                .animation(.linear)
            }
//            if activeIdx == 0 {
//
//            } else {
//
//            }
            .position(x: 0)
        }
        }
    }
}

//struct TextGeometry: View {
//    var body: some View {
//        GeometryReader { geometry in
//            return Rectangle().fill(Color.clear)
//        }
//    }
//}

struct ScrollableTabViewModifier: ViewModifier {
    @Binding var activeIdx: Int
    let idx: Int
    
    func body(content: Content) -> some View {
        Group {
            if activeIdx == idx {
                content.alignmentGuide(.underlineLeading) { d in
                    return d[.leading]
                }.onTapGesture {
                    withAnimation{
                        self.activeIdx = self.idx
                    }
                }
                
            } else {
                content.onTapGesture {
                    withAnimation{
                        self.activeIdx = self.idx
                    }
                }
            }
        }
    }
}
