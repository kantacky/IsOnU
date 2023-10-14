import FirebaseCore
import SwiftUI
import ShakingClient

public struct AppRoot: App {
    public init() {
        FirebaseApp.configure(options: .init(contentsOfFile: Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")!)!)
    }

    public var body: some Scene {
        WindowGroup {
//            TestView(store: .init(initialState: TestReducer.State(), reducer: {
//                TestReducer()
//            }))
            ShakeDetectionView()
        }
    }
}

import SwiftUI
import CoreMotion

struct ShakeDetectionView: View {
    @State private var isShaking = false
    let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            if isShaking {
                Text("デバイスが揺れてます")
            } else {
                Text("デバイスを振ってください")
            }
        }
        .onAppear() {
            startMotionUpdates()
        }
    }

    func startMotionUpdates() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.2
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                if let acceleration = data?.acceleration {
                    let magnitude = sqrt(acceleration.x * acceleration.x + acceleration.y * acceleration.y + acceleration.z * acceleration.z)
                    if magnitude >= 2.0 { // この値を調整して振動の感度を変更できます
                        isShaking = true
                    } else {
                        isShaking = false
                    }
                }
            }
        }
    }
}


