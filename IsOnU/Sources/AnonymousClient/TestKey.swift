import Foundation
import Dependencies

extension AnonymousClient: TestDependencyKey {
    public static let testValue: AnonymousClient = Self(
        signinAnonymously: unimplemented("signinAnonymously")
    )
}

