//
//  BodyParameterType.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation

public enum BodyParameterType {
    case data(Data)
    case JSON(Encodable)
    case customJSON(Encodable, encoder: JSONEncoder)
}
