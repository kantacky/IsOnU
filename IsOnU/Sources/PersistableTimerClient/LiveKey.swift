import Foundation

//public extension PersistableTimerClient {
//    static let live: PersistableTimerClient = Self(
//        
//
//
//    )
//
//
//}

/*
 public extension ShakingClient {
     static let live: ShakingClient = Self(
         startShaking: { param in
             try await withCheckedThrowingContinuation { configuration in
                 param.coreManager.deviceMotionUpdateInterval = 0.5
                 param.coreManager.startDeviceMotionUpdates(to: .main) { data, error in
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
 */
