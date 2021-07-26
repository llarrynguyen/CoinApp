//
//  ShadowModifier.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.gray.opacity(0.1), radius: 5, x: -5, y: -5)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

extension View {
    
    func shadowModifier() -> some View {
        return self.modifier(ShadowModifier())
    }
}

