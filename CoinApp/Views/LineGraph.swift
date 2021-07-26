//
//  LineGraph.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct LineShape: Shape {
    
    var dataPoints: [Double]
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            guard dataPoints.count > 1 else { return }
            let start = dataPoints[0]
            path.move(to: CGPoint(x: 0, y: (1 - start) * Double(rect.height)))
            
            for idx in dataPoints.indices {
                path.addLine(to: point(at: idx, in: rect))
            }
        }
    }
    
    private func point(at: Int, in rect: CGRect) -> CGPoint {
        let point = dataPoints[at]
        let x = Double(rect.width) * Double(at) / Double(dataPoints.count - 1)
        let y = (1 - point) * Double(rect.height)
        return CGPoint(x: x, y: y)
    }
}

