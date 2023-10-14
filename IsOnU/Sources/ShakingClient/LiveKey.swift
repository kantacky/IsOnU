import Foundation
import Dependencies
import CoreMotion

public extension ShakingClient {
    static let live: ShakingClient = Self(
        startShaking: { manager in
            try await withCheckedThrowingContinuation { configuration in
                manager.startDeviceMotionUpdates(to: .main) { data, error in
                    // 早期リターンでもいいかも
                    if let data {
                        let threshold: Double = 0.1
                        let userAcceleration = data.userAcceleration
                        if abs(userAcceleration.x) > threshold || abs(userAcceleration.y) > threshold || abs(userAcceleration.z) > threshold {
                            configuration.resume(returning: true)
                        } else {
                            configuration.resume(returning: false)
                        }
                    } else if let error {
                        configuration.resume(throwing: error)
                    }
                }
            }
        },
        stopShaking: { manager in
            manager.stopGyroUpdates()
        }
    )
}
