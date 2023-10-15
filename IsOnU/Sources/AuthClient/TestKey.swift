import Foundation
import Dependencies

extension AuthClient: TestDependencyKey {
    public static let testValue: Self = .init(
        signinAnonymously: unimplemented("signinAnonymously")
    )
}

