//
//  CoinDetailsView.swift
//  CryptoApp
//
//  Created by Anudhi on 27/04/23.
//

import SwiftUI

struct CoinDetailsView: View {
    
    private var viewModel : CoinDetailsViewModel
    
    init(coin: CoinModel){
        self.viewModel = CoinDetailsViewModel(coin: coin)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            //chart
            ChartView(viewModel: viewModel)
                .frame(height: 300)
                .padding(.vertical)
                .shadow(color: viewModel.chartLineColor, radius: 5.0)
                .shadow(color: viewModel.chartLineColor.opacity(0.5), radius: 2.0)
            //overView
            CoinDetailsSection(coinSectionDetailsModel: viewModel.overViewSectionModel)
                .padding(.vertical)
            //additional details
            CoinDetailsSection(coinSectionDetailsModel: viewModel.additionalSectionModel)
                .padding(.vertical)
        }
        .padding()
        .navigationTitle(viewModel.coinName)
    }
}
