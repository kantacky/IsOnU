import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct AudienceView: View {
    public typealias Reducer = AudienceReducer
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
                    RoomAudienceView(store: store)
                }

            case .expired:
                ExpiredView()
            }
        }
    }
}

#if DEBUG
#Preview {
    AudienceView(store: Store(
        initialState: AudienceView.Reducer.State(state: .inRoom(.init(room: .example0))),
        reducer: { AudienceView.Reducer() }
    ))
}
#endif
