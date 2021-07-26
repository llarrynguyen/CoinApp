//
//  RequestConverter.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

protocol RequestConverterProtocol {
    func convertRequest(requestEndpoint: EndpointProtocol) throws -> URLRequest
}

final class RequestConverter {
    
    enum URLRequestConvertibleError: Error {
        case couldNotCreate(description: String)
    }
    
    let urlBuilder: URLBuilderProtocol
    let bodyPreparator: BodyPreparatorProtocol
    
    init(urlBuilder: URLBuilderProtocol,
         bodyPreparator: BodyPreparatorProtocol) {
        self.urlBuilder = urlBuilder
        self.bodyPreparator = bodyPreparator
    }
}

extension RequestConverter: RequestConverterProtocol {
    public func convertRequest(requestEndpoint: EndpointProtocol) throws -> URLRequest {
        guard let url = try urlBuilder.makeURL(from: requestEndpoint) else {
            throw URLRequestConvertibleError.couldNotCreate(description: "Could not create components")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestEndpoint.method.rawValue
        urlRequest.allHTTPHeaderFields = requestEndpoint.headers

        guard let bodyParameterType = requestEndpoint.bodyParameterType else {
            return urlRequest
        }
        return try self.bodyPreparator.prepareBody(of: urlRequest, with: bodyParameterType)
    }
}
