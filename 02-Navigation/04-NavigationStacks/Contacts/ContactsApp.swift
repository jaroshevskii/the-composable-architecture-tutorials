//
//  ContactsApp.swift
//  Contacts
//
//  Created by Sasha Jaroshevskii on 8/20/25.
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
