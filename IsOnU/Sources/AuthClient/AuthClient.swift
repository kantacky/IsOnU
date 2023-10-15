import Foundation
import Dependencies

public struct AuthClient {
    public var signinAnonymously: @Sendable () async throws -> String

    public init(
        signinAnonymously: @Sendable @escaping () async throws -> String

    ) {
        self.signinAnonymously = signinAnonymously
    }
}

public extension DependencyValues {
    var authClient: AuthClient {
        get { self[AuthClient.self] }
        set { self[AuthClient.self] = newValue }
    }
}


