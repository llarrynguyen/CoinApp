//
//  CoinListViewModel.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import Foundation
import Combine

class CoinListViewModel: ObservableObject {
    
    var requestService = NetworManager.makeRequestService()
    
    @Published var coins = [CoinViewModel]()
    
    var cancellable: AnyCancellable?
    
    func getCoinInfos() {
        
        let endpoint = CoinService(symbols: Constants.symbols)
        let request = try! requestService.request(endpoint, responseType: CoinResponse.self)
        cancellable = request.receive(on: RunLoop.main).sink(receiveCompletion: { completion in
            switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
            }
        }, receiveValue: { coinResponse in
            self.coins = coinResponse.data.coins.map { CoinViewModel($0) }
        })
    }
}

