//
//  RequestService.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation
import Combine

public typealias DataTaskPublisherResponse = AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure>

public protocol RequestServiceProtocol {
    func request(requestEndpoint: EndpointProtocol) throws -> DataTaskPublisherResponse
    func request<T: Decodable>(_ requestEndpoint: EndpointProtocol, responseType: T.Type) throws -> AnyPublisher<T, Error>
}

class RequestService: NSObject {
    private let converter: RequestConverterProtocol
    private let pluginHandler: PluginHandlerProtocol
    
    private static let decoder = JSONDecoder()
    
    init(converter: RequestConverterProtocol, pluginHandler: PluginHandlerProtocol) {
        self.converter = converter
        self.pluginHandler = pluginHandler
    }
}

extension RequestService: RequestServiceProtocol {
    public func request(requestEndpoint: EndpointProtocol) throws -> AnyPublisher<URLSession.DataTaskPublisher.Output, URLSession.DataTaskPublisher.Failure> {
        let session = URLSession(configuration: .default)
        var urlRequest = try converter.convertRequest(requestEndpoint: requestEndpoint)
        
        urlRequest = pluginHandler.makePreRequestPluginCalls(endpoint: requestEndpoint, to: urlRequest)
        
        return URLSession.DataTaskPublisher(request: urlRequest, session: session).map { data, response -> URLSession.DataTaskPublisher.Output  in
            self.pluginHandler.makePostRequestPluginCalls(data, response, requestEndpoint)
            return (data: data, response: response)
        }.eraseToAnyPublisher()
    }
    
    public func request<T: Decodable>(_ requestEndpoint: EndpointProtocol,
                                      responseType: T.Type) throws -> AnyPublisher<T, Error>{
        let session = URLSession(configuration: .default)
        var urlRequest = try converter.convertRequest(requestEndpoint: requestEndpoint)
        
        urlRequest = pluginHandler.makePreRequestPluginCalls(endpoint: requestEndpoint, to: urlRequest)

        let publisher = URLSession.DataTaskPublisher(request: urlRequest, session: session)
        return publisher.map { data, response -> URLSession.DataTaskPublisher.Output in
            self.pluginHandler.makePostRequestPluginCalls(data, response, requestEndpoint)
            return (data: data, response: response)
        }.map {
            return $0.data
        }.decode(type: responseType, decoder: RequestService.decoder).eraseToAnyPublisher()
    }
}
