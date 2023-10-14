import ComposableArchitecture

public struct SpeakerReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var roomRegistration: RoomRegistrationReducer.State

        public init() {
            self.roomRegistration = .init()
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case roomRegistration(RoomRegistrationReducer.Action)
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Scope(state: \.roomRegistration, action: /Action.roomRegistration) {
            RoomRegistrationReducer()
        }

        Reduce { state, action in
            switch action {
            case .roomRegistration:
                return .none
            }
        }
    }
}
