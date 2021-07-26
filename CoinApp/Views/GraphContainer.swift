//
//  GraphContainer.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct GraphContainer: View {
    
    @State private var on = false
    
    var dataPoints: [Double]
    
    var strokeColor: Color {
        return dataPoints.first ?? 0 > dataPoints.last ?? 0 ? Color.red: Color.green
    }
    var body: some View {
        VStack {
            LineShape(dataPoints: dataPoints)
                .trim(to: on ? 1.6 : 0)
                .stroke(strokeColor, lineWidth: 2)
                .aspectRatio(18/9, contentMode: .fit)
                .border(Color.background, width: 1)
                .padding()
                .onAppear() {
                    withAnimation(Animation.easeOut(duration: 1.5)) {
                        self.on.toggle()
                    }
                }
        }
    }
}

