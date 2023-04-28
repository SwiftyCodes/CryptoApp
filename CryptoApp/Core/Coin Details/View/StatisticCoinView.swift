//
//  StatisticCoinView.swift
//  CryptoApp
//
//  Created by Anudhi on 28/04/23.
//

import SwiftUI

struct StatisticCoinView: View {
    
    let ststisticsModel : StatisticModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(ststisticsModel.title)
                .font(.caption)
            Text(ststisticsModel.value)
                .font(.headline)
            if let percentChnage = ststisticsModel.percentageChange {
                HStack(spacing: 4.0) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                    Text(percentChnage.toPercentString())
                        .font(.caption).bold()
                }
                .foregroundColor(.green)
            }
        }
    }
}


struct StatisticCoinView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticCoinView(ststisticsModel: dev.stas4)
    }
}
