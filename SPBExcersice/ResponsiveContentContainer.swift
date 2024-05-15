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
    @State private var screenSize: CGSize = .zero
    
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
