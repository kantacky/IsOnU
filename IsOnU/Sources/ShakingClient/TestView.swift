import SwiftUI
import ComposableArchitecture

public struct TestView: View {
    @ObservedObject private var viewStore: ViewStore<ViewState, TestReducer.Action>
    let store: StoreOf<TestReducer>

    public init(store: StoreOf<TestReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: ViewState.init(state:))
    }

    struct ViewState: Equatable {
        let test: Bool
        init(state: TestReducer.State) {
            test = state.test
        }
    }

    public var body: some View {
        Text("TestView")
            .onAppear {
                viewStore.send(.onAppear)
            }
            .onChange(of: viewStore.test) { oldValue, newValue in
                print(oldValue, newValue)
            }
    }
}
