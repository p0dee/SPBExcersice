//
//  OnboardingView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

/// Onboarding view explains the effectiveness of the service and leads to bililng
struct OnboardingView: View {
    
    /// Current screen size of app (not of device)
    @Environment(\.screenSize) var screenSize
    
    var body: some View {
        ZStack {
            // Background gradient
            Rectangle()
                .foregroundVerticalGradient(
                    start: .init(decimalRed: 213, green: 210, blue: 255),
                    end: .init(decimalRed: 255, green: 255, blue: 255)
                )
                .ignoresSafeArea()
            
            // Content (text labels, graph)
            VStack {
                Text("Hello\nSpeakBUDDY")
                    .responsiveFont(size: 36, weight: .bold, screenSize: screenSize)
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
                
                VerticalFixedSpacer(spacing: 85)
                    .responsiveScale()
                
                ZStack(alignment: .topLeading) {
                    GeometryReader(content: { geometry in
                        Image("Protty")
                            .offset(x: -37, y: -52)
                            .responsiveScaleEffect(screenSize: screenSize, anchor: .topLeading)
                    })
                    GraphView(
                        datas: [
                            .init(value: 0.280, title: "現在"),
                            .init(value: 0.385, title: "3ヶ月"),
                            .init(value: 0.754, title: "1年"),
                            .init(value: 1.000, title: "2年"),
                        ],
                        barSpacing: 26
                    )
                    .responsiveFont(size: 12, weight: .bold, screenSize: screenSize)
                }
                .responsiveFrame(idealHeight: 325, screenSize: screenSize)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 40)
                
                VerticalFixedSpacer(spacing: 30)
                    .responsiveScale()
                
                Text("スピークバディで")
                    .responsiveFont(size: 20, screenSize: screenSize)
                Text("レベルアップ")
                    .responsiveFont(size: 30, weight: .bold, screenSize: screenSize)
                    .foregroundVerticalGradient(
                        start: .init(decimalRed: 111, green: 212, blue: 255),
                        end: .init(decimalRed: 0, green: 117, blue: 255)
                    )
                
                VerticalFixedSpacer(spacing: 25)
                    .responsiveScale()
            }
            .safeAreaPadding()
            
            // Top/Bottom buttons
            VStack {
                HStack {
                    Spacer()
                    Button {
                        //TODO: close action
                    } label: {
                        Image(systemName: "xmark")
                            .fontWeight(.bold)
                    }
                    .buttonStyle(CloseButtonStyle())
                    .responsiveScaleEffect(screenSize: screenSize, anchor: .topTrailing, minScale: 1.0)
                }
                Spacer()
                Button(action: {
                    //TODO: register action
                }, label: {
                    Text("プランに登録する")
                        .responsiveFont(size: 16, weight: .semibold, screenSize: screenSize)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(RoundedButtonStyle())
            }
            .safeAreaPadding()
        }
    }
}

#Preview {
    OnboardingView()
}
