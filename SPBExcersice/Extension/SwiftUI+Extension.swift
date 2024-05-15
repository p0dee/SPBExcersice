//
//  SwiftUI+Extension.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI
import UIKit

extension View {
    
    /// Draw vertical gradient as foreground of this view
    /// - Parameters:
    ///   - start: Start (top) color of gradient
    ///   - end: End (bottom) color of gradient
    func foregroundVerticalGradient(start: Color, end: Color) -> some View {
        self
            .foregroundStyle(LinearGradient(
                colors: [start, end],
                startPoint: .top,
                endPoint: .bottom)
            )
    }
}

extension Color {
    
    /// Initializer with decimal RGB values
    /// - Parameters:
    ///   - red: Red 0...255
    ///   - green: Green 0...255
    ///   - blue: Blue 0...255
    init(decimalRed red: Int, green: Int, blue: Int) {
        self = .init(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
    }
    
    /// Brighter color
    /// - Parameter delta: Value to increase brightness of this color
    /// - Returns: Brighten color
    func brighter(_ delta: Double) -> Color {
        let uiColor = UIColor(self)
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0
        uiColor.getHue(&h, saturation: &s, brightness: &b, alpha: nil)
        return .init(hue: Double(h), saturation: Double(s), brightness: Double(b + delta))
    }
}
