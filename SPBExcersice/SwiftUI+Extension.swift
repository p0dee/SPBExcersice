//
//  SwiftUI+Extension.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

extension View {
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
    init(decimalRed red: Int, green: Int, blue: Int) {
        self = .init(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
    }
}
