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
    
    var body: some View {
        GeometryReader(content: { geometry in
            HStack(alignment: .bottom) {
                ForEach(datas) { data in
                    BarElement(data: data)
                        .frame(height: data.value * geometry.size.height)
                }
            }
        })
    }
    
    struct BarElement: View {
        let data: Data
        
        var body: some View {
            VStack {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 3, bottomLeading: 0, bottomTrailing: 0, topTrailing: 3), style: .continuous)
                Text(data.title)
            }
        }
    }
}

#Preview {
    GraphView(datas: [
        .init(value: 0.2, title: "現在"),
        .init(value: 0.3, title: "3ヶ月"),
        .init(value: 0.6, title: "1年"),
        .init(value: 1.0, title: "2年"),
    ])
}
