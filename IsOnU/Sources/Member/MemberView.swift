import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct MemberView: View {
    public typealias Reducer = MemberReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        SwitchStore(self.store) { state in
            switch state {
            case .inRoom:
                CaseLet(/Reducer.State.inRoom, action: Reducer.Action.inRoom) { store in
                    RoomMemberView(store: store)
                }

            case .expired:
                ExpiredView()
            }
        }
    }
}

#Preview {
    MemberView(store: Store(
        initialState: MemberView.Reducer.State(state: .inRoom(.init(room: .example0))),
        reducer: { MemberView.Reducer() }
    ))
}
