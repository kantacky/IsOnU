import ComposableArchitecture
import Dependencies
import CoreMotion

public struct TestReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        let motionManager = CMMotionManager()
        var test = false
        public init() {}
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onAppear
        case testResponse(TaskResult<Bool>)
        case onDisappear
    }

    // MARK: - Dependencies
    @Dependency(\.shakingClient) private var shakingClient
    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce {
            state,
            action in
            switch action {
            case .onAppear:
                return .run { [state] send in
                    await send(
                        .testResponse(
                            TaskResult {
                                try await shakingClient.startShaking(state.motionManager)
                            }
                        )
                    )
                }

            case let .testResponse(.success(test)):
                state.test = test
                return .none

            case let .testResponse(.failure):
                return .none


            case .onDisappear:
                return .run { [state] send in
                   try await shakingClient.stopShaking(state.motionManager)
                }
            }
        }
    }
}
