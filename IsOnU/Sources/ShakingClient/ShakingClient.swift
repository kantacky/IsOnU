import Foundation
import SwiftUI
import Dependencies
import CoreMotion

public struct ShakingClient {
    public var startShaking: @Sendable (StartShakingParam) async throws -> Bool
    public var stopShaking: @Sendable (CMMotionManager) async throws -> Void

    public init(
        startShaking: @Sendable @escaping (StartShakingParam) async throws -> Bool,
        stopShaking: @Sendable @escaping (CMMotionManager) async throws -> Void
    ) {
        self.startShaking = startShaking
        self.stopShaking = stopShaking
    }
}

public extension ShakingClient {
    struct StartShakingParam {
        let isActive: Bool
        let coreManager: CMMotionManager

        public init(
            isActive: Bool,
            coreManager: CMMotionManager
        ) {
            self.isActive = isActive
            self.coreManager = coreManager
        }
    }
}


public extension DependencyValues {
    var shakingClient: ShakingClient {
        get { self[ShakingClient.self] }
        set { self[ShakingClient.self] = newValue }
    }
}
