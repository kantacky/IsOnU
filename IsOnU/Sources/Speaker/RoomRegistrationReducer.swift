import ComposableArchitecture
import Models

public struct RoomRegistrationReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var themeColor: ThemeColor
        @PresentationState var roomSettings: RoomSettingsReducer.State?

        public init() {
            themeColor = .pink
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onThemeColorChanged(ThemeColor)
        case onCreateRoomButtonTapped
        case roomSettings(PresentationAction<RoomSettingsReducer.Action>)
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
                state.roomSettings = .init(room: .init(speaker: .example0))
                return .none

            case .roomSettings:
                return .none
            }
        }
        .ifLet(\.$roomSettings, action: /Action.roomSettings) {
            RoomSettingsReducer()
        }
    }
}
