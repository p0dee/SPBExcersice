//
//  SwiftUI+Responsive.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/14.
//

import SwiftUI

/// Scale ratio of current screen size to reference screen size (full screen of iPhone 14)
/// - Parameter screenSize: Curren screen size of the app (not of a device)
private func scaleRatio(screenSize: CGSize) -> CGFloat {
    let standardScreenHeight: CGFloat = 844 // iPhone 14 screen height
    var scaleRatio = screenSize.height / standardScreenHeight
    if scaleRatio == 0 {
        // width == 0 will be occured when is called in #Preview
        scaleRatio = 1
    }
    return scaleRatio
}

extension View {
    
    /// Sets the *responsive* font size for text in this view, *responsive* means the size will be scaled along with screen size of the app automatically
    /// - Parameters:
    ///   - size: Reference font size (for full screen of iPhone 14)
    ///   - weight: Font weight
    ///   - screenSize: current screen size of the app
    /// - Note: This modifier uses `SwiftUI.View.font(_ font:)` internally, so refert to the document of the API for more detail behavior.
    func responsiveFont(size: Double, weight: Font.Weight = .regular, screenSize: CGSize) -> some View {
        let scaleRatio = scaleRatio(screenSize: screenSize)
        return self
            .font(.system(size: size * scaleRatio, weight: weight))
    }
    
    /// Sets the *responsive* frame for text in this view, *responsive* means the size will be scaled along with screen size of the app automatically
    /// - Parameters:
    ///   - size: Reference font size (for full screen of iPhone 14)
    ///   - weight: Font weight
    ///   - screenSize: current screen size of the app
    /// - Note: This modifier uses `SwiftUI.Text.frame(minWidth: ...)` internally, so refert to the document of the API for more detail behavior.
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
    
    /// Scale this view along with screen size of the app automatically
    /// - Parameters:
    ///   - screenSize: current screen size of the app
    ///   - anchor: The point with a default of ``UnitPoint/center`` that defines the location within the view from which to apply the transformation.
    ///   - minScale: Minimum limit of auto scale. If responsive scale is less than `minScale`, this value will be taken as actual scale.
    ///   - maxScale: Maximum limit of auto scale. If responsive scale is greater than `maxScale`, this value will be taken as actual scale.
    /// - Note: This modifier uses `SwiftUI.Text.scaleEffect(_ scale:, anchor:)` internally, so refert to the document of the API for more detail behavior.
    func responsiveScaleEffect(screenSize: CGSize, anchor: UnitPoint = .center, minScale: Double = 0, maxScale: Double = .greatestFiniteMagnitude) -> some View {
        let scale = scaleRatio(screenSize: screenSize)
        let actualScale = max(minScale, min(maxScale, scale))
        return self
            .scaleEffect(.init(width: actualScale, height: actualScale), anchor: anchor)
    }
}

extension Text {
    
    /// Sets the *responsive* font size for text in the view, *responsive* means the size will be scaled along with screen size of the app automatically
    /// - Parameters:
    ///   - size: Reference font size (for full screen of iPhone 14)
    ///   - weight: Font weight
    ///   - screenSize: current screen size of the app
    /// - Note: This modifier uses `SwiftUI.Text.font(_ font:)` internally, so refert to the document of the API for more detail behavior.
    func responsiveFont(size: Double, weight: Font.Weight = .regular, screenSize: CGSize) -> Text {
        let scaleRatio = scaleRatio(screenSize: screenSize)
        return self
            .font(.system(size: size * scaleRatio, weight: weight))
    }
}
