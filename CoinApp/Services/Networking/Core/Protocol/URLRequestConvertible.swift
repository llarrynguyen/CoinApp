//
//  URLRequestConvertible.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

/**
 Protocol that defines the function signatiure of an Object that can convert to an ``URLRequest``
 */
public protocol URLRequestConvertible {
    func convertToURLRequest() throws -> URLRequest
}
