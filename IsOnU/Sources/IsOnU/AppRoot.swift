import ComposableArchitecture
import FirebaseCore
import SwiftUI

public struct AppRoot: App {
    private let store: StoreOf<CoreReducer>

    public init() {
        FirebaseApp.configure(options: .init(contentsOfFile: Bundle.module.path(forResource: "GoogleService-Info", ofType: "plist")!)!)
        self.store = Store(initialState: CoreReducer.State(), reducer: { CoreReducer() })
    }

    public var body: some Scene {
        WindowGroup {
            CoreView(store: self.store)
        }
    }
}
