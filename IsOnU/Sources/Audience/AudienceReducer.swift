import ComposableArchitecture

public struct AudienceReducer: Reducer {
    // MARK: - State
    public enum State: Equatable {
        case inRoom(RoomAudienceReducer.State)
        case expired

        public init(state: Self) {
            self = state
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case inRoom(RoomAudienceReducer.Action)
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .inRoom:
                return .none
            }
        }
        .ifCaseLet(/State.inRoom, action: /Action.inRoom) {
            RoomAudienceReducer()
        }
    }
}
