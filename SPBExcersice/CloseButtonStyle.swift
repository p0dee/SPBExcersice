//
//  CloseButtonStyle.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct CloseButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .frame(width: 38, height: 38)
            .background(
                Circle()
                    .fill(.white)
                    .shadow(
                        color: .black.opacity(configuration.isPressed ? 0.35 : 0.2),
                        radius: configuration.isPressed ? 2 : 10,
                        y: configuration.isPressed ? 1 : 2
                    )
            )
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Image(systemName: "xmark")
    }
    .buttonStyle(CloseButtonStyle())
}
