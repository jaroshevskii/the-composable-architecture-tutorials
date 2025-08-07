//
//  ContactsFeature.swift
//  YourFirstPresentation
//
//  Created by Sasha Jaroshevskii on 06.08.2025.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State {
        @Presents var addContact: AddContactFeature.State?
        
        var contacts: IdentifiedArrayOf<Contact> = []    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                
                return .none
            
            case .addContact(.presented(.cancelButtonTapped)):
                state.addContact = nil
                return .none
                
            case .addContact(.presented(.saveButtonTapped)):
                guard let contact = state.addContact?.contact else {
                    return .none
                }
                state.contacts.append(contact)
                state.addContact = nil
                return .none
                
            case .addContact:
                return .none
            }
        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}

struct ContactsView: View {
    @Bindable var store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(store.contacts) { contact in
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem {
                    Button {
                        store.send(.addButtonTapped)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(
            item: $store.scope(state: \.addContact, action: \.addContact)
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
    }
}

#Preview {
    ContactsView(
        store: Store(
            initialState: ContactsFeature.State(
                contacts: [
                    Contact(id: UUID(), name: "Blob"),
                    Contact(id: UUID(), name: "Blob Jr"),
                    Contact(id: UUID(), name: "Blob Sr"),
                ]
            )
        ) {
            ContactsFeature()
        }
    )
}
