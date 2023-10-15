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
    public enum Action: Equatable {}

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {}
        }
    }
}
