import ComposableArchitecture
import Foundation
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
                guard let userId: String = UserDefaults.standard.string(forKey: "userId") else {
                    return .none
                }
                let room: Room = .init(speaker: User(id: userId), themeColor: state.themeColor)
                state.roomSettings = .init(room: room)
                return .run { send in
                    do {
                        try await self.firestoreClient.createRoom(room)
                    } catch {
#if DEBUG
                        print(error.localizedDescription)
#endif
                    }
                }

            case .roomSettings:
                return .none
            }
        }
        .ifLet(\.$roomSettings, action: /Action.roomSettings) {
            RoomSettingsReducer()
        }
    }
}
