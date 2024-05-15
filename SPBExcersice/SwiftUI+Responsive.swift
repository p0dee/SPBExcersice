//
//  SwiftUI+Responsive.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/14.
//

import SwiftUI

private func scaleRatio(screenSize: CGSize) -> CGFloat {
    let standardScreenHeight: CGFloat = 844
    var scaleRatio = screenSize.height / standardScreenHeight
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
    
    func responsiveFrame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil, minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil, alignment: Alignment = .center, screenSize: CGSize) -> some View {
        func scaled(_ value: CGFloat?) -> CGFloat? {
            if let value {
                return value * scaleRatio(screenSize: screenSize)
            } else {
                return nil
            }
        }
        return self
            .frame(
                minWidth: scaled(minWidth),
                idealWidth: scaled(idealWidth),
                maxWidth: scaled(maxWidth),
                minHeight: scaled(minHeight),
                idealHeight: scaled(idealHeight),
                maxHeight: scaled(maxHeight),
                alignment: alignment
            )
    }
    
    func responsiveScaleEffect(screenSize: CGSize, anchor: UnitPoint = .center, minScale: Double = 0, maxScale: Double = .greatestFiniteMagnitude) -> some View {
        let scale = scaleRatio(screenSize: screenSize)
        let actualScale = max(minScale, min(maxScale, scale))
        return self
            .scaleEffect(.init(width: actualScale, height: actualScale), anchor: anchor)
    }
}

extension Text {
    func responsiveFont(size: Double, weight: Font.Weight = .regular, screenSize: CGSize) -> Text {
        let scaleRatio = scaleRatio(screenSize: screenSize)
        return self
            .font(.system(size: size * scaleRatio, weight: weight))
    }
}
