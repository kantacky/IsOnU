import Audience
import ComposableArchitecture
import FirestoreClient
import Foundation
import Models
import Member
import Speaker

public struct CoreReducer: Reducer {
    // MARK: - State
    public enum State: Equatable {
        case speaker(SpeakerReducer.State)
        case member(MemberReducer.State)
        case audience(AudienceReducer.State)

        public init() {
            self = .speaker(.init())
        }
    }

    // MARK: - Action
    public enum Action: Equatable {
        case onOpenURL(URL)
        case getRoomResponse(TaskResult<Room>, UserProperty)
        case speaker(SpeakerReducer.Action)
        case member(MemberReducer.Action)
        case audience(AudienceReducer.Action)
    }

    // MARK: - Dependencies
    @Dependency(\.firestoreClient)
    private var firestoreClient

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onOpenURL(url):
                guard let urlComponents: URLComponents = .init(url: url, resolvingAgainstBaseURL: true) else {
                    return .none
                }
                guard let roomId = url.pathComponents.last else {
                    return .none
                }
                guard let isAs = urlComponents.queryItems?.first?.value else {
                    return .none
                }
                let userProperty: UserProperty = isAs == "member" ? .member : .audience

                return .run { send in
                    await send(.getRoomResponse(TaskResult {
                        try await self.firestoreClient.getRoomData(roomId)
                    }, userProperty))
                }

            case let .getRoomResponse(.success(room), userProperty):
                switch userProperty {
                case .audience:
                    state = .audience(.init())

                case .member:
                    state = .member(.init(state: .inRoom(.init(room: room))))

                default:
                    break
                }
                return .none

            case let .getRoomResponse(.failure(error), userProperty):
#if DEBUG
                print(error.localizedDescription)
#endif
                switch userProperty {
                case .audience:
                    state = .audience(.init())

                case .member:
                    state = .member(.init(state: .expired))

                default:
                    break
                }
                return .none

            case .speaker:
                return .none

            case .member:
                return .none

            case .audience:
                return .none
            }
        }
        .ifCaseLet(/State.speaker, action: /Action.speaker) {
            SpeakerReducer()
        }
        .ifCaseLet(/State.member, action: /Action.member) {
            MemberReducer()
        }
        .ifCaseLet(/State.audience, action: /Action.audience) {
            AudienceReducer()
        }
    }
}
