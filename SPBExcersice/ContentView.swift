//
//  ContentView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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

struct VerticalFixedSpacer: View {
    let spacing: CGFloat
    
    var body: some View {
        Spacer()
            .frame(idealHeight: spacing)
            .fixedSize(horizontal: false, vertical: true)
    }
}

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

#Preview {
    ContentView()
}
