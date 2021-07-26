//
//  ColorExtension.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//


import SwiftUI

extension UIColor {
    convenience init(hex: String) {
        var inputString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if inputString.hasPrefix("#") {
            inputString.remove(at: inputString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: inputString).scanHexInt64(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


extension Color {
    static let background = Color.white
    static let gray = Color.gray
    static let shadow = Color.black
    
    init(hex: String) {
        self.init(UIColor(hex: hex))
    }
}

