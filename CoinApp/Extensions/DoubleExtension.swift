//
//  DoubleExtension.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

extension Double {
    func convert(from input: ClosedRange<Self>, to output: ClosedRange<Self>) -> Self {
        
        let x = (output.upperBound - output.lowerBound) * (self - input.lowerBound)
        let y = (input.upperBound - input.lowerBound)
        return x / y + output.lowerBound
    }
}

