//
//  ResponsiveContentContainer.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/14.
//

import SwiftUI

/// Environment key for set/get screen size of the app
struct ScreenSizeEnvironmentKey: EnvironmentKey {
    typealias Value = CGSize
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    
    /// Environment value for screen size of the app (not of device screen)
    var screenSize: CGSize {
        get {
            self[ScreenSizeEnvironmentKey.self]
        }
        set {
            self[ScreenSizeEnvironmentKey.self] = newValue
        }
    }
}

/// Container view that make its holding views scaled automatically along with screen size of the app.
/// You need to use `View.responsive...` modifiers to get benefit fron its responsive layout system.
struct ResponsiveContentContainer<Content>: View where Content: View {
    
    /// Current screen size of app (not of device)
    @State private var screenSize: CGSize = .zero
    
    /// Content
    private var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader(content: { geometry in
                Rectangle()
                    .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
                    .onAppear(perform: {
                        screenSize = geometry.size
                        print("screen size: \(screenSize)")
                    })
            })
            .ignoresSafeArea()
            content()
                .environment(\.screenSize, screenSize)
        }
    }
}

#Preview {
    ResponsiveContentContainer {
        Text("Hello World!")
    }
}
