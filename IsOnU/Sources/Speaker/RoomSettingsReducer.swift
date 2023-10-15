import ComposableArchitecture
import Models

public struct RoomSettingsReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        var room: Room
        var timerMinutes: Int
        @PresentationState var roomSpeaker: RoomSpeakerReducer.State?

        public init(room: Room) {
            self.room = room
            self.timerMinutes = room.timerSeconds / 60
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onTimerMinutesChanged(Int)
        case onStartButtonTapped
        case roomSpeaker(PresentationAction<RoomSpeakerReducer.Action>)
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
                state.room.timerStartedAt = .now
                state.roomSpeaker = .init(room: state.room)
                return .none

            case .roomSpeaker:
                return .none
            }
        }
        .ifLet(\.$roomSpeaker, action: /Action.roomSpeaker) {
            RoomSpeakerReducer()
        }
    }
}
