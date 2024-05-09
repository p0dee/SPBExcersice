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
            Spacer() //GraphView
                .frame(idealHeight: 325)
                .fixedSize(horizontal: false, vertical: true)
            VerticalFixedSpacer(spacing: 30)
            Text("スピークバディで")
                .font(.title)
            Text("レベルアップ")
                .font(.largeTitle)
                .fontWeight(.bold)
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

#Preview {
    ContentView()
}
