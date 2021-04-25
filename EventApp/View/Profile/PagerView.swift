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
    @State private var w: [CGFloat]
    private let dataSet: [LocalizedStringKey]
    init(activeIdx: Binding<Int>, dataSet: [LocalizedStringKey]) {
        self._activeIdx = activeIdx
        self.dataSet = dataSet
        _w = State.init(initialValue: [CGFloat](repeating: 0, count: dataSet.count))
        
    }
    
    var body: some View {
        VStack(alignment: .underlineLeading) {
            HStack {
                ForEach(0..<dataSet.count) { i in
                        Text(dataSet[i])
                            .customFont(name: Configuration.shabnam, style: .headline)
                            .foregroundColor(Color.black)
                            .modifier(ScrollableTabViewModifier(activeIdx: $activeIdx, idx: i))
                            .background(TextGeometry())
                            .onPreferenceChange(WidthPreferenceKey.self, perform: { self.w[i] = $0 })
                            .id(i)

                    Spacer().frame(width: 70)
                }
            }
            .padding(.horizontal, 5)
            Colors.primaryRed
                .clipShape(Rectangle(), style: FillStyle())
                .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                .frame(width: w[activeIdx],  height: 4)
                .animation(.linear)
        }
    }
}

struct TextGeometry: View {
    var body: some View {
        GeometryReader { geometry in
            return Rectangle().fill(Color.clear).preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}

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
