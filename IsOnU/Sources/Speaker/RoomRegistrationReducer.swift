import ComposableArchitecture
import FirestoreClient
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
        case createRoomResult(TaskResult<Void>)
        case roomSettings(PresentationAction<RoomSettingsReducer.Action>)
    }

    // MARK: - Dependencies
    @Dependency(\.firestoreClient)
    private var firestoreClient

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onThemeColorChanged(newValue):
                state.themeColor = newValue
                return .none

            case .onCreateRoomButtonTapped:
                let room: Room = .init(speaker: .example0, themeColor: state.themeColor)
                state.roomSettings = .init(room: room)
                return .run { send in
                    await send(.createRoomResult(TaskResult {
                        try await self.firestoreClient.createRoom(room)
                    }))
                }

            case .createRoomResult(.success):
                return .none

            case .createRoomResult(.failure(error)):
#if DEBUG
                print(error.localizedDescription)
#endif
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
