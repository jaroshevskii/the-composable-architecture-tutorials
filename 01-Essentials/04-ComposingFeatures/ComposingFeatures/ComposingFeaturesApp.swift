//
//  ComposingFeaturesApp.swift
//  ComposingFeatures
//
//  Created by Sasha Jaroshevskii on 03.08.2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct ComposingFeaturesApp: App {
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
