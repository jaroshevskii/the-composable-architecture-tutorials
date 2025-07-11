//
//  CounterFeature.swift
//  YourFirstFeature
//
//  Created by Sasha Jaroshevskii on 06.07.2025.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case resetButtonTapped
        case _performHaptic(HapticType)
    }

    enum HapticType {
        case success, warning, error
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .send(._performHaptic(.warning))

            case .incrementButtonTapped:
                state.count += 1
                return .send(._performHaptic(.success))

            case .resetButtonTapped:
                state.count = 0
                return .send(._performHaptic(.error))

            case let ._performHaptic(type):
                return .run { _ in
                    let generator = await UINotificationFeedbackGenerator()
                    await generator.prepare()
                    switch type {
                    case .success:
                        await generator.notificationOccurred(.success)
                    case .warning:
                        await generator.notificationOccurred(.warning)
                    case .error:
                        await generator.notificationOccurred(.error)
                    }
                }
            }
        }
    }
}


struct CounverView: View {
    var body: some View {
        EmptyView()
    }
}
