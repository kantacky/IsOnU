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
        let isShaking: Bool
        init(state: TestReducer.State) {
            isShaking = state.isShaking
        }
    }

    public var body: some View {
        if viewStore.isShaking {
            Text("振ってください")
        } else {
            Text("TestView")
                .onAppear {
                    viewStore.send(.onAppear)
                }
                .onChange(of: viewStore.isShaking) { oldValue, newValue in
                    print(oldValue, newValue)
                }
        }

    }
}
