//
//  AnyEncodable.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//
import Foundation

/**
 ``AnyEncodable`` is a Type that boxes any ``Encodable`` Object
 so it can be used where Protocols can't
*/
struct AnyEncodable {
    private let encodable: Encodable
    
    init(encodable: Encodable) {
        self.encodable = encodable
    }
}

extension AnyEncodable: Encodable {
    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
