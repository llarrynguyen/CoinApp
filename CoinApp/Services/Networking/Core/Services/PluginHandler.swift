//
//  PluginHandler.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

protocol PluginHandlerProtocol {
    func makePostRequestPluginCalls(_ data: Data, _ response: URLResponse, _ requestEndpoint: EndpointProtocol)
    func makePreRequestPluginCalls(endpoint: EndpointProtocol, to urlRequest: URLRequest) -> URLRequest
}

struct PluginHandler: PluginHandlerProtocol {
    func makePostRequestPluginCalls(_ data: Data, _ response: URLResponse, _ requestEndpoint: EndpointProtocol) {
        requestEndpoint.plugins.forEach {
            let result: URLSession.DataTaskPublisher.Output = (data: data, response: response)
            $0.didReceive(result: result, endpoint: requestEndpoint)
        }
    }
    
    func makePreRequestPluginCalls(endpoint: EndpointProtocol, to urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        
        endpoint.plugins.forEach {
            urlRequest = $0.prepare(request: urlRequest, endpoint: endpoint)
        }
        
        endpoint.plugins.forEach {
            $0.willSend(request: urlRequest, endpoint: endpoint)
        }
        
        return urlRequest
    }
}
