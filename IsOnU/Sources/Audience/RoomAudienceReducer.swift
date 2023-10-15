import ComposableArchitecture
import Models

public struct RoomAudienceReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var room: Room

        public init(room: Room) {
            self.room = room
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onAppear
        case onDisappear
        case decrementTimerSeconds
    }

    // MARK: - Dependencies

    public init() {}

    private enum CancelID {
        case timer
    }

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    while true {
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        await send(.decrementTimerSeconds)
                    }
                }
                .cancellable(id: CancelID.timer)

            case .onDisappear:
                return .cancel(id: CancelID.timer)

            case .decrementTimerSeconds:
                state.room.timerSeconds -= 1
                if state.room.timerSeconds < 1 {
                    return .cancel(id: CancelID.timer)
                }
                return .none
            }
        }
    }
}
