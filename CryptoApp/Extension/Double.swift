//
//  Double.swift
//  CryptoApp
//
//  Created by Anudhi on 27/04/23.
//

import Foundation

extension Double {
    
    private var currencyFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.locale = Locale(identifier: "USD")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return "$\(currencyFormatter.string(for: self) ?? "$0.00")"
    }
    
    func toPercentString() -> String {
        guard let numberPercentString = numberFormatter.string(for: self) else {return "0.00%"}
        return numberPercentString + "%"
    }
    
    func asNumberString() -> String {
        return  String(format: "%.2f", self)
    }
    
    /*
     convert 1234 to 1.234k
     convert 12345 to 123.45k
     */
    
    func formattedWithAbbreviation() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        switch num {
        case 1_000_000_000_000...:
            let formated = num / 1_000_000_000_000
            let stringFormatted = formated.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formated = num / 1_000_000_000
            let stringFormatted = formated.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formated = num / 1_000_000
            let stringFormatted = formated.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formated = num / 1_000
            let stringFormatted = formated.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()
        default:
            return "\(sign)\(self)"
        }
    }
}

