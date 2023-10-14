import Foundation
import Dependencies
import ComposableArchitecture

public struct AnonymousClient {
    public var signinAnonymously: @Sendable () async throws -> String

    public init(
        signinAnonymously: @Sendable @escaping () async throws -> String

    ) {
        self.signinAnonymously = signinAnonymously
    }
}

public extension DependencyValues {
    var authClient: AnonymousClient {
        get { self[AnonymousClient.self] }
        set { self[AnonymousClient.self] = newValue }
    }
}


