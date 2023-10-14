import ComposableArchitecture
import Foundation
import XCTest
@testable import IsOnU

@MainActor
final class IsOnUTests: XCTestCase {
    func testOnOpenURL() async {
        let store: TestStoreOf<CoreReducer> = TestStore(initialState: CoreReducer.State(), reducer: { CoreReducer() })

        let roomId: UUID = .init()
        let token: UUID = .init()
        let url: URL = .init(string: "https://isonu.kantacky.com/rooms/\(roomId)?token=\(token)")!

        await store.send(.onOpenURL(url)) {
            $0.url = url
        }
    }
}
