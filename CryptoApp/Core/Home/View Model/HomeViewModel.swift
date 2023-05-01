//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var coinsData = [CoinModel]()
    @Published var topCoins = [CoinModel]()
    @Published var isLoadingData = true
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
       let urlString = "https:api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { dataValue, responseValue, errorValue in
            if let error = errorValue {
                print("DEBUG : Error \(error)")
                self.isLoadingData = false
                return
            }
            if let response = responseValue as? HTTPURLResponse {
                print("DEBUG : Response should be 200 and it is == \(response.statusCode)")
            }
            guard let data = dataValue else {return}
            do {
                let coinsData = try JSONDecoder().decode([CoinModel].self, from: data)
                DispatchQueue.main.async {
                    self.coinsData = coinsData
                    self.configureTopMovers()
                    self.isLoadingData = false
                }
                print("DEBUG Coins data \(coinsData)")
            } catch let err {
                print("DEBUG decoder error \(err)")
                self.isLoadingData = false
            }

        }.resume()
    }
    
    func configureTopMovers() {
        let topMovers = coinsData.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H})
        topCoins = Array(topMovers.prefix(5))
    }
    
}

//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
