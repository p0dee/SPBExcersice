//
//  GraphView.swift
//  SPBExcersice
//
//  Created by Takeshi Tanaka on 2024/05/09.
//

import SwiftUI

/// Display bar graph with animation
/// - Note: This is intended to be used on `OnboardingView`.
struct GraphView: View {
    
    /// Graph value for each data
    struct Data: Identifiable {
        var id: String {
            title
        }
        
        /// value (0...1)
        var value: Double
        
        /// title text (will be displayed below a bar)
        var title: String
    }
    
    /// Graph value datas
    let datas: [Data]
    
    /// Spacing for each bars
    let barSpacing: Double
    
    var body: some View {
        GeometryReader(content: { geometry in
            HStack(alignment: .bottom, spacing: barSpacing) {
                ForEach(datas.indices, id: \.self) { index in
                    Bar(
                        data: datas[index], 
                        strechBarAfter: 1.0 + TimeInterval(index) * 0.15
                    )
                    .frame(height: datas[index].value * geometry.size.height)
                }
            }
        })
    }
    
    /// Bar view on `BarGraph`
    private struct Bar: View {
        
        /// Value for a bar
        let data: Data
        
        /// Duration until the animation of the bar expanding starts
        let strechBarAfter: TimeInterval
        
        /// `true` if the stretching animation has already started
        @State private var isBarStretched: Bool = false
        
        var body: some View {
            VStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 3, bottomLeading: 0, bottomTrailing: 0, topTrailing: 3), style: .continuous)
                    .foregroundVerticalGradient(
                        start: .init(decimalRed: 88, green: 192, blue: 255),
                        end: .init(decimalRed: 31, green: 143, blue: 255)
                    )
                    .scaleEffect(x: 1.0, y: isBarStretched ? 1 : 0, anchor: .bottom)
                    .animation(.easeOut(duration: 0.5), value: isBarStretched)
                Text(data.title)
            }
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: strechBarAfter, repeats: false) { _ in
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
