//
//  LazyNavigationView.swift
//  CryptoApp
//
//  Created by Anudhi on 01/05/23.
//

// Fancy way to say --> Dont build the Content unless the user goes there
import Foundation
import SwiftUI

struct LazyNavigationView<Content : View> : View {
    let build : () -> Content
    init(build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body : Content {
        build()
    }
}
