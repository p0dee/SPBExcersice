//
//  RoundedButtonStyle.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

/// Button style for rounded and bordered
struct RoundedButtonStyle: ButtonStyle {
    
    /// Title text color, default value is `.white`
    private var titleColor: Color = .white
    
    /// Button fill color, default value is rgba(59, 167, 255, 1)
    private var fillColor: Color = .init(decimalRed: 59, green: 167, blue: 255)
    
    /// Button border color, default value is `.white`
    private var borderColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(titleColor)
            .padding(.vertical, 16)
            .padding(.horizontal, 32)
            .background(
                Capsule()
                    .fill(fillColor.brighter(configuration.isPressed ? 0.1 : 0))
                    .stroke(borderColor, lineWidth: 1)
                    .shadow(
                        color: .black.opacity(configuration.isPressed ? 0.35 : 0.2),
                        radius: configuration.isPressed ? 2 : 10,
                        y: configuration.isPressed ? 1 : 2
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
    
    /// Set title text color
    func titleColor(_ color: Color) -> Self {
        var result = self
        result.titleColor = color
        return result
    }
    
    /// Set button fill color
    func fillColor(_ color: Color) -> Self {
        var result = self
        result.fillColor = color
        return result
    }
    
    /// Set button border color
    func borderColor(_ color: Color) -> Self {
        var result = self
        result.borderColor = color
        return result
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(RoundedButtonStyle())
}
