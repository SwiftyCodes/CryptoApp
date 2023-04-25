//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct CoinRowView: View {
    var body: some View {
        HStack(spacing: 2.0){
            
            //Market Cap Rank
            Text("1")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal, 4)
            
            //Image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            //Coin Info
            CoinInfo()
            
        }
        .padding(.horizontal)
        .padding(.vertical, 4.0)
    }
}

struct CoinInfo: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text("Bitcoin")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Text("BTC")
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.bold)
                .padding(.leading, 6)
        }
        .padding(.leading, 2)
        
        Spacer()
        
        VStack(alignment: .trailing, spacing: 4.0) {
            Text("$2000")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
            
            Text("- 10%")
                .foregroundColor(.green)
                .font(.caption)
                .fontWeight(.bold)
                .padding(.leading, 6)
        }
        .padding(.leading, 2)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
