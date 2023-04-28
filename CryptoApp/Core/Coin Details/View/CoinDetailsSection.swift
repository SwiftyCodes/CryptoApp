//
//  CoinDetailsSection.swift
//  CryptoApp
//
//  Created by Anudhi on 27/04/23.
//

import SwiftUI

struct CoinDetailsSection: View {
    
    let coinSectionDetailsModel : CoinDetailsSectionModel
    
    private let coloums : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack() {
            Text(coinSectionDetailsModel.sectionName)
                .font(.title).bold()
                .frame(maxWidth : .infinity, alignment : .leading)            
           
            LazyVGrid(columns: coloums, alignment: .leading, spacing: 20.0) {
                //statistic View
                ForEach(coinSectionDetailsModel.statisticModel) { statisticsData in
                    StatisticCoinView(ststisticsModel: statisticsData)
                }
            }
            
        }
    }
}

struct CoinDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSection(coinSectionDetailsModel: dev.sectionModel)
    }
}
