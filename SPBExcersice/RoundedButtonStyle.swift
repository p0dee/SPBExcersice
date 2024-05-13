//
//  RoundedButtonStyle.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    private var titleColor: Color = .white
    private var fillColor: Color = .init(decimalRed: 59, green: 167, blue: 255)
    private var borderColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(titleColor)
            .padding(.vertical, 16)
            .padding(.horizontal, 32)
            .background(
                Capsule()
                    .fill(fillColor)
                    .stroke(borderColor, lineWidth: 1)
                    .shadow(
                        color: .black.opacity(configuration.isPressed ? 0.35 : 0.2),
                        radius: configuration.isPressed ? 2 : 10,
                        y: configuration.isPressed ? 1 : 2
                    )
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
    
    func titleColor(_ color: Color) -> Self {
        var result = self
        result.titleColor = color
        return result
    }
    
    func fillColor(_ color: Color) -> Self {
        var result = self
        result.fillColor = color
        return result
    }
    
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
