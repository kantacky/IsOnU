import FirebaseCore
import SwiftUI

public struct AppRoot: App {
    public init() {
        FirebaseApp.configure(options: .init(contentsOfFile: Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")!)!)
    }

    public var body: some Scene {
        WindowGroup {
            CoreView()
        }
    }
}
