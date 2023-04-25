//
//  AllCryptoViews.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct AllCoinView: View {
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
                    ForEach(0..<15, id: \.self) { _ in
                        //Row Coin View
                        CoinRowView()
                    }
                }
            }
        }
        .padding(10)
    }
}

struct AllCryptoViews_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinView()
    }
}
