//
//  VerticalFixedSpacer.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

/// Spacer that has a fixed height. It also can be scaled responsively.
struct VerticalFixedSpacer: View {
    
    /// Current screen size of app (not of device)
    @Environment(\.screenSize) var screenSize
    
    /// Spacing height
    private let spacing: CGFloat
    
    /// If you need to scale this view responsively, place in a `ResponsiveContentContainer` and set this value `true`
    private var responsive: Bool = false
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
    
    var body: some View {
        if responsive {
            Spacer()
                .responsiveFrame(idealHeight: spacing, screenSize: screenSize)
                .fixedSize(horizontal: false, vertical: true)
        } else {
            Spacer()
                .frame(idealHeight: spacing)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    /// Make enable responsive auto-scaling behaviour. (You need to place this view in a `ResponsiveContentContainer`)
    func responsiveScale() -> some View {
        var result = self
        result.responsive = true
        return result
    }
}
