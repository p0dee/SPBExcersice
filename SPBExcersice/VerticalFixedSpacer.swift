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
    let spacing: CGFloat
    
    /// If you need to scale this view responsively, place in a `ResponsiveContentContainer` and set this value `true`
    let responsive: Bool
    
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
}
