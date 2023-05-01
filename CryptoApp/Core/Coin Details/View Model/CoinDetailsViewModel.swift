//
//  CoinDetailsViewModel.swift
//  CryptoApp
//
//  Created by Anudhi on 28/04/23.
//

import SwiftUI

class CoinDetailsViewModel {
    
    private var coin : CoinModel
    //Chart Config
    var chartData = [ChartDataModel]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    init(coin: CoinModel){
        self.coin = coin
        configireChartData()
    }
    
    var coinName : String {
        return coin.name
    }
    
    var chartLineColor : Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var overViewSectionModel : CoinDetailsSectionModel {
        
        //Current Price
        let price = coin.currentPrice.toCurrency()
        let pricePercentageChnage = coin.priceChangePercentage24H
        let priceStats = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentageChnage)
        
        //Market Cap Stats
        let marketCap = coin.marketCap ?? 0
        let marketCapPercentageChnage = coin.priceChangePercentage24H
        let marketCapStats = StatisticModel(title: "Market Capatalization", value: marketCap.formattedWithAbbreviation(), percentageChange: marketCapPercentageChnage)
        
        //Rank
        let rank = coin.marketCapRank
        let rankStats = StatisticModel(title: "Rank", value: "\(rank)", percentageChange: nil)
        
        //Volume
        let volume = coin.totalVolume ?? 0.0
        let volumeStats = StatisticModel(title: "Volume", value: volume.formattedWithAbbreviation(), percentageChange: nil)
        
        return CoinDetailsSectionModel(sectionName: "Overview", statisticModel: [priceStats, marketCapStats, rankStats, volumeStats])
    }
    
    var additionalSectionModel : CoinDetailsSectionModel {
        
        //24h High
        let high24h = coin.high24H?.toCurrency() ?? "N/A"
        let high24hStats = StatisticModel(title: "24H High", value: high24h, percentageChange: nil)
        
        //24h Low
        let low24h = coin.low24H?.toCurrency() ?? "N/A"
        let low24hStats = StatisticModel(title: "24H Low", value: low24h, percentageChange: nil)
        
        //24h Price Change
        let priceChange24h = coin.priceChange24H.toCurrency()
        let pricePercentageChnage24h = coin.priceChangePercentage24H
        let priceChange24hStats = StatisticModel(title: "24H Price Change", value: priceChange24h, percentageChange: pricePercentageChnage24h)
        
        //24h market cap
        let marketCap24h = coin.marketCapChange24H ?? 0.0
        let marketCapPercentageChnage24h = coin.marketCapChangePercentage24H
        let marketCap24hStats = StatisticModel(title: "24H Market Cap", value: "$\(marketCap24h.formattedWithAbbreviation())", percentageChange: marketCapPercentageChnage24h)
        
        return CoinDetailsSectionModel(sectionName: "Additional Details", statisticModel: [high24hStats, low24hStats, priceChange24hStats, marketCap24hStats])
    }
    
    func configireChartData() {
        guard let priceData = coin.sparklineIn7D?.price else {return}
        var index = 0
        self.minPrice = priceData.min()!
        self.maxPrice = priceData.max()!
        self.yAxisValues = [minPrice , (minPrice + maxPrice)/2 ,maxPrice]
        //7 days, 24h, 60 mins, 60 sec
        self.endDate = Date(coinGeckoDateString: coin.lastUpdated ?? "")
        self.startDate = endDate.addingTimeInterval(-7 * 24 * 60 * 60)
        self.xAxisValues = [startDate, endDate]
        for price in priceData.reversed() {
            //-1 hour, 60 mins, 60 sec
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartItemData = ChartDataModel(date: date, value: price)
            self.chartData.append(chartItemData)
            index += 1
        }
    }
}
