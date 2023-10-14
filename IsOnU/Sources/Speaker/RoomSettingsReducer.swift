import ComposableArchitecture
import Models

public struct RoomSettingsReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var room: Room
        var timerMinutes: Int

        public init(room: Room) {
            self.room = room
            self.timerMinutes = room.timerSeconds / 60
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onTimerMinutesChanged(Int)
        case onStartButtonTapped
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onTimerMinutesChanged(newValue):
                state.timerMinutes = newValue
                state.room.timerSeconds = newValue * 60
                return .none

            case .onStartButtonTapped:
                return .none
            }
        }
    }
}
