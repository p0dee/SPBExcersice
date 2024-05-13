//
//  OnboardingView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/13.
//

import SwiftUI

struct OnboardingView: View {
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
                    }
                }
                VerticalFixedSpacer(spacing: 10)
                Text("Hello\nSpeakBUDDY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                VerticalFixedSpacer(spacing: 85)
                GraphView(datas: [
                    .init(value: 0.2, title: "現在"),
                    .init(value: 0.3, title: "3ヶ月"),
                    .init(value: 0.6, title: "1年"),
                    .init(value: 1.0, title: "2年"),
                ])
                .frame(idealHeight: 325)
                .fixedSize(horizontal: false, vertical: true)
                VerticalFixedSpacer(spacing: 30)
                Text("スピークバディで")
                    .font(.title)
                Text("レベルアップ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundVerticalGradient(
                        start: .init(decimalRed: 111, green: 212, blue: 255),
                        end: .init(decimalRed: 0, green: 117, blue: 255)
                    )
                VerticalFixedSpacer(spacing: 25)
                Button("プランに登録する") {
                    //TODO: register action
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    OnboardingView()
}
