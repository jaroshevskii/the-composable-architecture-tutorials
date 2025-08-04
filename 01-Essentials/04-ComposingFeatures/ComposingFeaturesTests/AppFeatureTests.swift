//
//  AppFeatureTests.swift
//  ComposingFeaturesTests
//
//  Created by Sasha Jaroshevskii on 05.08.2025.
//

import ComposableArchitecture
import Testing

@testable import ComposingFeatures

@MainActor
struct AppFeatureTests {
    @Test
    func incrementInFirstTab() async throws {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
        }
        
    }
}
