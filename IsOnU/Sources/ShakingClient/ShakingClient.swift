import Foundation
import Dependencies
import CoreMotion

public struct ShakingClient {
    public var startShaking: @Sendable (CMMotionManager) async throws -> Bool
    public var stopShaking: @Sendable (CMMotionManager) async throws -> Void

    public init(
        startShaking: @Sendable @escaping (CMMotionManager) async throws -> Bool,
        stopShaking: @Sendable @escaping (CMMotionManager) async throws -> Void
    ) {
        self.startShaking = startShaking
        self.stopShaking = stopShaking
    }
}


public extension DependencyValues {
    var shakingClient: ShakingClient {
        get { self[ShakingClient.self] }
        set { self[ShakingClient.self] = newValue }
    }
}
