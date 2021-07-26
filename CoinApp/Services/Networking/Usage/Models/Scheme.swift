//
//  Scheme.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

public enum Scheme {
    case http
    case https
    case custom(scheme: String)
}

extension Scheme {
    public var stringValue: String {
        switch self {
            case .http:
                return "http"
            case .https:
                return "https"
            case .custom(let scheme):
                return scheme
        }
    }
}
