//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Anudhi on 25/04/23.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 16){
                    ForEach(0..<5, id: \.self) { _ in
                        TopMoversItemView()
                    }
                }
            }
        }
        .padding(10)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
