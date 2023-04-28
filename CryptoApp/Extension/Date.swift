//
//  Date.swift
//  CryptoApp
//
//  Created by Anudhi on 29/04/23.
//

import Foundation

extension Date {
    init(coinGeckoDateString : String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoDateString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
