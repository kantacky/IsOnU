import Audience
import ComposableArchitecture
import Foundation
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
        case speaker(SpeakerReducer.Action)
        case member(MemberReducer.Action)
        case audience(AudienceReducer.Action)
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .onOpenURL(url):
                state = .audience(.init())
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
