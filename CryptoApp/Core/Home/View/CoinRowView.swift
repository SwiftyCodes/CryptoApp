//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    
    let singleCoin : CoinModel
    
    var body: some View {
        HStack(){
            
            //Market Cap Rank
            Text("\(singleCoin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal, 2)
            
            //Image
            KFImage(URL(string: singleCoin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            //Coin Info
            CoinInfo(singleCoin: singleCoin)
            
        }
        .padding(.horizontal, 6.0)
        .padding(.vertical, 4.0)
    }
}

struct CoinInfo: View {
    
    let singleCoin : CoinModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("\(singleCoin.name)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Text("\(singleCoin.symbol.uppercased())")
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.bold)
                .padding(.leading, 6)
        }
        .padding(.leading, 2)
        .foregroundColor(Color.theme.primaryTextColor)
        
        Spacer()
        
        VStack(alignment: .trailing, spacing: 4.0) {
            Text(singleCoin.currentPrice.toCurrency())
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Text(singleCoin.priceChange24H.toPercentString())
                .foregroundColor(singleCoin.priceChange24H > 0 ? .green : .red)
                .font(.caption)
                .fontWeight(.bold)
                .padding(.leading, 6)
        }
        .padding(.leading, 2)
        .foregroundColor(Color.theme.primaryTextColor)
    }
}
