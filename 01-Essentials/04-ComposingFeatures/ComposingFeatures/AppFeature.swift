//
//  AppFeature.swift
//  ComposingFeatures
//
//  Created by Sasha Jaroshevskii on 04.08.2025.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct AppFeature {
    struct State: Equatable {
        var tab1 = CounterFeature.State()
        var tab2 = CounterFeature.State()
    }
    
    enum Action {
        case tab1(CounterFeature.Action)
        case tab2(CounterFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.tab1, action: \.tab1) {
            CounterFeature()
        }
        
        Scope(state: \.tab2, action: \.tab2) {
            CounterFeature()
        }
        
        Reduce { state, action in
            return .none
        }
    }
}

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
              .tabItem {
                  Text("Counter 1")
              }
            
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
              .tabItem {
                  Text("Counter 2")
              }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}
