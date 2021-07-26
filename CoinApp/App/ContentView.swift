//
//  ContentView.swift
//  CoinApp
//
//  Created by Larry Nguyen on 7/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var vm = CoinListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        UITableViewCell.appearance().selectionStyle = .none
        
        vm.getCoinInfos()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.background
            List {
                VStack(alignment: .center) {
                    Text("Coin List")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding(.top, 0)
                        .padding(.leading, 0).padding(.trailing, 0)
                        .shadowModifier()
                    
                    ForEach(vm.coins) { coin in
                        CoinCell(coin: coin)
                            .shadowModifier()
                    }
                }.background(Color.background)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
