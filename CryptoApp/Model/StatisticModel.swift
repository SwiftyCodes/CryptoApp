//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Anudhi on 28/04/23.
//

import Foundation

struct StatisticModel : Identifiable {
    let id = UUID().uuidString
    let title : String
    let value : String
    let percentageChange : Double?
}
