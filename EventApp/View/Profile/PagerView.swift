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
    
    let margin:CGFloat = 10
    let screenWidth = UIScreen.main.bounds.width
    @Binding var activeIdx: Int
    @State private var widthList: [CGFloat]
    private let dataSet: [String]
    @State var selectedItem: String = "Tweets"
    @State private var w: [CGFloat] = [0, 0, 0, 0]

    init(activeIdx: Binding<Int>, dataSet: [String]) {
        self._activeIdx = activeIdx
        self.dataSet = dataSet
        _widthList = State.init(initialValue: [CGFloat](repeating: UIScreen.main.bounds.width/CGFloat(dataSet.count), count: dataSet.count))
    }
    
    var body: some View {
        return VStack(alignment: .underlineLeading) {
            HStack {
                Spacer()
                Text(dataSet[0].localized()).modifier(MagicStuff(activeIdx: $activeIdx, widths: $w, idx: 0))
                Spacer()
                Text(dataSet[1].localized()).modifier(MagicStuff(activeIdx: $activeIdx, widths: $w, idx: 1))
                Spacer()
            }
            .frame(height: 20)
            Rectangle()
                .alignmentGuide(.underlineLeading) { d in d[.leading]  }
                .frame(width: w[activeIdx],  height: 2)
                .animation(.linear)
                .colorMultiply(.red)
        }
    }
}

struct MagicStuff: ViewModifier {
    
    @Binding var activeIdx: Int
    @Binding var widths: [CGFloat]
    let idx: Int

    func body(content: Content) -> some View {
        Group {
            if activeIdx == idx {
                content.alignmentGuide(.underlineLeading) { d in
                    DispatchQueue.main.async { self.widths[self.idx] = d.width }
                    return d[.leading]
                }.onTapGesture { self.activeIdx = self.idx }

            } else {
                content.onTapGesture { self.activeIdx = self.idx }
            }
        }
    }
}
