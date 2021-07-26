//
//  CoinResponse.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//


import Foundation

struct CoinResponse: Decodable {
    let status: String
    let data: CoinData
}

struct CoinData: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable {
    let name: String
    let price: String
    let symbol: String
    let color: String
    let change: Double
    let history: [String]
}

