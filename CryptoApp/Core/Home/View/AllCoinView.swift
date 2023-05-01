//
//  AllCryptoViews.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct AllCoinView: View {
    
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
            
            HStack(spacing : 16){
                Text("Coins")
                Spacer()
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal, 5)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing : 16){
                    ForEach(viewModel.coinsData) { singleCoin in
                        //Row Coin View
                        NavigationLink {
                            LazyNavigationView(build: CoinDetailsView(coin: singleCoin))
                        } label: {
                            CoinRowView(singleCoin: singleCoin)
                        }
                    }
                }
            }
        }
        .padding(10)
    }
}
