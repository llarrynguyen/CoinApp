//
//  CoinService.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation
import Combine

struct CoinService: EndpointProtocol {
    let symbols: [String]
    
    init(symbols: [String]) {
        self.symbols = symbols
    }
}

extension CoinService {
    var method: HTTPMethod {
        return .get
    }
    
    var url: String {
        return "api.coinranking.com"
    }
    
    var path: String {
        return "/v1/public/coins"
    }
    
    var urlParameters: [String: String] {
        let dict = ["base": "USD", "timePeriod": "7d", "symbols": symbols.joined(separator: ",")]
        return dict
    }
    
    var plugins: [Plugin] {
        var list = [Plugin]()
        list.append(CoinFlowPlugin())
        return list
    }
}

struct CoinFlowPlugin: Plugin {
    func prepare(request: URLRequest, endpoint: EndpointProtocol) -> URLRequest {
        return request
    }
    
    func willSend(request: URLRequest, endpoint: EndpointProtocol) {
        print("Coin request will send...")
    }
    
    func didReceive(result: URLSession.DataTaskPublisher.Output, endpoint: EndpointProtocol) {
        print("Coin request is finished")
    }
}
