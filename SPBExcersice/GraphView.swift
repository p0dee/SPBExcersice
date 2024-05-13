//
//  GraphView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/09.
//

import SwiftUI

struct GraphView: View {
    struct Data: Identifiable {
        var id: String {
            title
        }
        
        var value: Double
        var title: String
    }
    
    let datas: [Data]
    let barSpacing: Double
    
    var body: some View {
        GeometryReader(content: { geometry in
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(datas.indices, id: \.self) { index in
                    BarElement(
                        data: datas[index], 
                        expandBarAfter: 1.0 + TimeInterval(index) * 0.15
                    )
                    .frame(height: datas[index].value * geometry.size.height)
                }
            }
        })
    }
    
    private struct BarElement: View {
        let data: Data
        let expandBarAfter: TimeInterval
        
        @State private var isBarStretched: Bool = false
        
        var body: some View {
            VStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 3, bottomLeading: 0, bottomTrailing: 0, topTrailing: 3), style: .continuous)
                    .foregroundVerticalGradient(
                        start: .init(decimalRed: 88, green: 192, blue: 255),
                        end: .init(decimalRed: 31, green: 143, blue: 255)
                    )
                    .scaleEffect(x: 1.0, y: isBarStretched ? 1 : 0, anchor: .bottom) //FIXME: scaleによってアニメーションをかけると、アニメーション初期にバーの角丸が潰れてしまう問題がある（角丸サイズやdurationの短さからほぼ気がづくのは不可能）
                    .animation(.easeOut(duration: 0.5), value: isBarStretched)
                Text(data.title)
            }
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: expandBarAfter, repeats: false) { _ in
                    isBarStretched = true
                }
            })
        }
    }
}

#Preview {
    GraphView(datas: [
        .init(value: 0.2, title: "現在"),
        .init(value: 0.3, title: "3ヶ月"),
        .init(value: 0.6, title: "1年"),
        .init(value: 1.0, title: "2年"),
    ], barSpacing: 8)
}
