//
//  Plugin.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

public protocol Plugin {
    func prepare(request: URLRequest, endpoint: EndpointProtocol) -> URLRequest
    func willSend(request: URLRequest, endpoint: EndpointProtocol)
    func didReceive(result: URLSession.DataTaskPublisher.Output, endpoint: EndpointProtocol)
}
