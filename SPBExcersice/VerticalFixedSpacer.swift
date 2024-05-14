//
//  VerticalFixedSpacer.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct VerticalFixedSpacer: View {
    @Environment(\.screenSize) var screenSize
    
    let spacing: CGFloat
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
