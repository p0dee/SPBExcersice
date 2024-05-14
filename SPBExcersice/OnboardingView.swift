//
//  OnboardingView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.screenSize) var screenSize
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundVerticalGradient(
                    start: .init(decimalRed: 213, green: 210, blue: 255),
                    end: .init(decimalRed: 255, green: 255, blue: 255)
                )
                .ignoresSafeArea()
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
                    .responsiveScale(screenSize: screenSize, anchor: .topTrailing)
                }
                VerticalFixedSpacer(spacing: 10, responsive: true)
                Text("Hello\nSpeakBUDDY")
                    .responsiveFont(size: 36, weight: .bold, screenSize: screenSize)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                VerticalFixedSpacer(spacing: 85, responsive: true)
                ZStack(alignment: .topLeading) {
                    GeometryReader(content: { geometry in
                        Image("Protty")
                            .offset(x: -37, y: -52)
                            .responsiveScale(screenSize: screenSize, anchor: .topLeading)
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
                VerticalFixedSpacer(spacing: 30, responsive: true)
                Text("スピークバディで")
                    .responsiveFont(size: 20, screenSize: screenSize)
                Text("レベルアップ")
                    .responsiveFont(size: 30, weight: .bold, screenSize: screenSize)
                    .foregroundVerticalGradient(
                        start: .init(decimalRed: 111, green: 212, blue: 255),
                        end: .init(decimalRed: 0, green: 117, blue: 255)
                    )
                VerticalFixedSpacer(spacing: 25, responsive: true)
                Button(action: {
                    //TODO: register action
                }, label: {
                    Text("プランに登録する")
                        .responsiveFont(size: 16, weight: .semibold, screenSize: screenSize)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(RoundedButtonStyle())
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    OnboardingView()
}
