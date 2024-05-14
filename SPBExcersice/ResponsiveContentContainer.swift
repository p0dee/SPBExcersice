//
//  ResponsiveContentContainer.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/14.
//

import SwiftUI

struct ScreenSizeEnvironmentKey: EnvironmentKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get {
            self[ScreenSizeEnvironmentKey.self]
        }
        set {
            self[ScreenSizeEnvironmentKey.self] = newValue
        }
    }
}

struct ResponsiveContentContainer<Content>: View where Content: View {    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            content()
                .environment(\.screenSize, geometry.size)
        })
        .ignoresSafeArea()
    }
}

#Preview {
    ResponsiveContentContainer {
        Text("Hello World!")
    }
}
