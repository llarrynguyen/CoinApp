//
//  CoinCell.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct CoinCell: View {
    
    let coin: CoinViewModel
    
    private let positiveChangeColor = Color.green
    private let negativeChangeColor = Color.red
    
    @State private var showGraph = false
    @State private var selectedItem: CoinViewModel?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "bitcoinsign.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(2)
                    .background(coin.color)
                    .cornerRadius(30)
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .foregroundColor(Color.gray)
                    
                    Text(String(format: "%@%0.2f", coin.change > 0.0 ? "+" : "", coin.change))
                        .foregroundColor(coin.change > 0.0 ? positiveChangeColor : negativeChangeColor)
                }
                
                Spacer()
                
                VStack {
                    Text(coin.formattedPrice)
                        .foregroundColor(Color.gray)
                }
            }
            .shadowModifier()
            .padding()
            .background(
                Text(coin.symbol.uppercased())
                    .font(.system(size: 60))
                    .rotationEffect(.degrees(-90))
                    .foregroundColor(Color.shadow)
                    .opacity(0.1)
                    .shadowModifier()
                    .offset(x: 80)
            )
            .background(Color.background)
            .cornerRadius(20)
            .padding()
            .onTapGesture {
                self.showGraph.toggle()
            }
            
            if self.showGraph {
                GraphContainer(dataPoints: coin.historyDataPoints)
                    .frame(height: 180)
                    .offset(y: -20)
            }
        }
    }
}

