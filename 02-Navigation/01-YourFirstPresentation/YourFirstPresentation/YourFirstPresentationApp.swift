//
//  YourFirstPresentationApp.swift
//  YourFirstPresentation
//
//  Created by Sasha Jaroshevskii on 06.08.2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct YourFirstPresentationApp: App {
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
    }
    
    var body: some Scene {
        WindowGroup {
            ContactsView(store: Self.store)
        }
    }
}
