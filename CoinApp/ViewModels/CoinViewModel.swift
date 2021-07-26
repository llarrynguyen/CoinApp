//
//  CoinViewModel.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct CoinViewModel: Identifiable {
    
    private let coin: Coin
    
    var historyDataPoints: [Double] {
        let historyNums = coin.history.map { value in
            Double(value)!
        }
        
        let min = historyNums.min()!
        let max = historyNums.max()!
        
        var computedValues = [Double]()
        for item in historyNums {
            computedValues.append(item.convert(from: min...max, to: 0...1))
        }
        
        return computedValues
    }
    
    var id: UUID {
        return UUID()
    }
    
    var symbol: String {
        return coin.symbol.lowercased()
    }
    
    var color: Color {
        return Color(hex: coin.color)
    }
    
    var change: Double {
        return coin.change
    }
    
    
    var name: String {
        return coin.name
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: Double(coin.price)! as NSNumber)!
    }
    
    
    init(_ coin: Coin) {
        self.coin = coin
    }
}

