import ComposableArchitecture
import Foundation

public struct CoreReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        public init() {}
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onOpenURL(URL)
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onOpenURL(url):
                return .none
            }
        }
    }
}
