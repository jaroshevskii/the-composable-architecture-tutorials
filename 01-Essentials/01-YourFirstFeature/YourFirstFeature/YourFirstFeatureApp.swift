//
//  YourFirstFeatureApp.swift
//  YourFirstFeature
//
//  Created by Sasha Jaroshevskii on 06.07.2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct YourFirstFeatureApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: Self.store)
        }
    }
}
