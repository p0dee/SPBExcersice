//
//  SwiftUI+Responsive.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/14.
//

import SwiftUI

private func scaleRatio(screenSize: CGSize) -> CGFloat {
    let standardScreenWidth: CGFloat = 390
    var scaleRatio = screenSize.width / standardScreenWidth
    if scaleRatio == 0 {
        // width == 0 が #Preview で発生しうるため
        scaleRatio = 1
    }
    return scaleRatio
}

extension View {    
    func responsiveFont(size: Double, weight: Font.Weight = .regular, screenSize: CGSize) -> some View {
        let scaleRatio = scaleRatio(screenSize: screenSize)
        return self
            .font(.system(size: size * scaleRatio, weight: weight))
    }
}

extension Text {
    func responsiveFont(size: Double, weight: Font.Weight = .regular, screenSize: CGSize) -> Text {
        let scaleRatio = scaleRatio(screenSize: screenSize)
        return self
            .font(.system(size: size * scaleRatio, weight: weight))
    }
}
