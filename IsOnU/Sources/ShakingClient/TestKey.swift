import Foundation
import Dependencies

extension ShakingClient: TestDependencyKey {
    public static let testValue: ShakingClient = Self(
        startShaking: unimplemented("startShaking"),
        stopShaking: unimplemented("stopShaking")
    )
}

