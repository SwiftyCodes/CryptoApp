//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Anudhi on 28/04/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperPreviewData {
        return DeveloperPreviewData.instance
    }
}

class DeveloperPreviewData {
    static let instance = DeveloperPreviewData()
    
    let stas1 = StatisticModel(title: "Current Price", value: "$23,536.99", percentageChange: 1.23)
    let stas2 = StatisticModel(title: "Market Capatalization", value: "4.315Bn", percentageChange: 4.23)
    let stas3 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stas4 = StatisticModel(title: "Volume", value: "35.00Bn", percentageChange:nil)
    
    
    let sectionModel = CoinDetailsSectionModel(sectionName: "OverView", statisticModel: [StatisticModel(title: "Current Price", value: "$23,536.99", percentageChange: 1.23),
                                                                                         StatisticModel(title: "Market Capatalization", value: "4.315Bn", percentageChange: 4.23) ,
                                                                                         StatisticModel(title: "Rank", value: "1", percentageChange: nil) ,
                                                                                         StatisticModel(title: "Volume", value: "35.00Bn", percentageChange:nil)])
}
