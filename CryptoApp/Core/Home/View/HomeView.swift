//
//  HomeView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                //Top Movers View
                VStack {
                    TopMoversView(viewModel: viewModel)
                }
                Divider()
                //All Coins View
                AllCoinView(viewModel: viewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
