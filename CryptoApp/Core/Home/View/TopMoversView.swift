//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct TopMoversView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 16){
                    ForEach(viewModel.topCoins) { singleCoin in
                        NavigationLink {
                            LazyNavigationView(build: CoinDetailsView(coin: singleCoin))
                        } label: {
                            TopMoversItemView(singleCoin: singleCoin)
                        }
                    }
                }
            }
        }
        .padding(10)
    }
}

