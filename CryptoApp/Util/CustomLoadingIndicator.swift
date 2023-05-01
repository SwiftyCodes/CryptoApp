//
//  CustomLoadingIndicator.swift
//  CryptoApp
//
//  Created by Anudhi on 01/05/23.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .accentColor(.white)
            .scaleEffect(x : 1.5, y: 1.5, anchor: .center)
            .frame(width: 80.0, height: 80.0)
            .background(Color(.systemGray4))
            .cornerRadius(20.0)
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingIndicator()
    }
}
