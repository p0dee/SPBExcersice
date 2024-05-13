//
//  VerticalFixedSpacer.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct VerticalFixedSpacer: View {
    let spacing: CGFloat
    
    var body: some View {
        Spacer()
            .frame(idealHeight: spacing)
            .fixedSize(horizontal: false, vertical: true)
    }
}
