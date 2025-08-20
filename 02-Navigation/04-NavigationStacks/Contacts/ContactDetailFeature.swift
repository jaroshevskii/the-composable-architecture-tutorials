//
//  ContactDetailFeature.swift
//  Contacts
//
//  Created by Sasha Jaroshevskii on 8/20/25.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ContactDetailFeature {
    @ObservableState
    struct State: Equatable {
        let contact: Contact
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}

struct ContactDetailView {
    let store: StoreOf<ContactDetailFeature>
    
    var body: some View {
        Form {
            
        }
        .navigationTitle(Text(store.contact.name))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Blob")
                ),
            ) {
               ContactDetailFeature()
            )
        )
    }
}
