import ComposableArchitecture

public struct MemberReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        public init() {}
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
