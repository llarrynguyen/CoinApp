//
//  NetworManager.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

public struct NetworManager {
    public static func makeRequestService() -> RequestServiceProtocol {
        let requestConverter = RequestConverter(urlBuilder: URLBuilder(),
                                                bodyPreparator: BodyPreparator())
        let requestService = RequestService(converter: requestConverter, pluginHandler: PluginHandler())
        return requestService
    }
}
