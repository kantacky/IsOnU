import FirebaseCore
import SwiftUI
import ShakingClient

public struct AppRoot: App {
    public init() {
        FirebaseApp.configure(options: .init(contentsOfFile: Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")!)!)
    }

    public var body: some Scene {
        WindowGroup {
            TestView(store: .init(initialState: TestReducer.State(), reducer: {
                TestReducer()
            }))
//            Text("!s on U")
        }
    }
}
