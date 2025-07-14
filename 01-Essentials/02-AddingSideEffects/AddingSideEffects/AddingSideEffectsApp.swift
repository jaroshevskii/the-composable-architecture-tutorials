//
//  AddingSideEffectsApp.swift
//  AddingSideEffects
//
//  Created by Sasha Jaroshevskii on 14.07.2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct AddingSideEffects: App {
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
