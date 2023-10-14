import ComposableArchitecture
import Models

public struct RoomRegistrationReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var themeColor: ThemeColor

        public init() {
            themeColor = .pink
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onThemeColorChanged(ThemeColor)
        case onCreateRoomButtonTapped
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onThemeColorChanged(newValue):
                state.themeColor = newValue
                return .none

            case .onCreateRoomButtonTapped:
                return .none
            }
        }
    }
}
