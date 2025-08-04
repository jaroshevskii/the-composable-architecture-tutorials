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
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: Self.store)
        }
    }
}
