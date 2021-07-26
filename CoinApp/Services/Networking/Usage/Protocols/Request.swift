//
//  EndpointProtocol.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

public protocol EndpointProtocol {
    var scheme: Scheme { get }
    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var urlParameters: [String: String] { get }
    var bodyParameterType: BodyParameterType? { get }
    var plugins: [Plugin] { get }
}

public extension EndpointProtocol {
    var scheme: Scheme { return .https }
    var headers: [String: String] { return [:] }
    var urlParameters: [String: String] { return [:] }
    var bodyParameterType: BodyParameterType? { return nil }
    var plugins: [Plugin] { return [] }
}
