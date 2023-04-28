//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    
    let singleCoin : CoinModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //Image
            KFImage(URL(string: singleCoin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            //Coin name and Price - Horizontal Stack
            HStack(spacing: 2.0){
                Text("\(singleCoin.symbol.uppercased())")
                    .font(.caption)
                    .fontWeight(.bold)
                Text(singleCoin.currentPrice.toCurrency())
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            //Coin Movment
            Text(singleCoin.priceChange24H.toPercentString())
                .font(.title2)
                .foregroundColor(singleCoin.priceChange24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .foregroundColor(Color.theme.itemBackgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color((.systemGray4)), lineWidth: 2.0)
        )
        
    }
}
