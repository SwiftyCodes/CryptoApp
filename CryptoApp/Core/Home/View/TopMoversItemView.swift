//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct TopMoversItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //Image
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            //Coin name and Price - Horizontal Stack
            HStack(spacing: 2.0){
                Text("BTC")
                    .font(.caption)
                    .fontWeight(.bold)
                Text("$2000")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            //Coin Movment
            Text("+ 10%")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color((.systemGray4)), lineWidth: 2.0)
        )
        
    }
}

struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItemView()
    }
}
