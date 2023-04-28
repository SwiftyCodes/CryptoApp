//
//  ChartDataModel.swift
//  CryptoApp
//
//  Created by Anudhi on 29/04/23.
//

import Foundation

struct ChartDataModel : Identifiable {
    let id = UUID().uuidString
    let date : Date
    let value : Double
}
