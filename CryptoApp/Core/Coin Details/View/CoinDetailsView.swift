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
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                //chart
                ChartView(viewModel: viewModel)
                    .frame(height: 300)
                    .padding(.vertical)
                //overView
                CoinDetailsSection(coinSectionDetailsModel: viewModel.overViewSectionModel)
                    .padding(.vertical)
                //additional details
                CoinDetailsSection(coinSectionDetailsModel: viewModel.additionalSectionModel)
                    .padding(.vertical)
            }
        }
        .padding()
        .navigationTitle("Bitcoin")
    }
}
