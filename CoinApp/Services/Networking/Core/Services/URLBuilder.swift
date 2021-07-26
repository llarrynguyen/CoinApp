//
//  URLBuilder.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

protocol URLBuilderProtocol {
    func makeURL(from requestEndpoint: EndpointProtocol) throws -> URL?
    func makeQueryString(from parameters: [String: String]) throws -> String
}

struct URLBuilder: URLBuilderProtocol {
    func makeURL(from requestEndpoint: EndpointProtocol) throws -> URL? {
        var components = URLComponents()
        components.host = requestEndpoint.url
        components.query = try makeQueryString(from: requestEndpoint.urlParameters)
        components.scheme = requestEndpoint.scheme.stringValue
        components.path = requestEndpoint.path
        return components.url
    }
    
    func makeQueryString(from parameters: [String: String]) throws -> String {
        var components: [(String, String)] = []
        for key in parameters.keys {
            guard let value = parameters[key] else { continue }
            components.append((key, value))
        }
        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}
