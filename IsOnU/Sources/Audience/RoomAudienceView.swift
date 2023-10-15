import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct RoomAudienceView: View {
    public typealias Reducer = RoomAudienceReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        ZStack {
            ReactionPicker()

            // TODO: Reactions
        }
        .onAppear {
            self.viewStore.send(.onAppear)
        }
        .onDisappear {
            self.viewStore.send(.onDisappear)
        }
    }
}

#if DEBUG
#Preview {
    RoomAudienceView(store: Store(
        initialState: RoomAudienceView.Reducer.State(room: .example0),
        reducer: { RoomAudienceView.Reducer() }
    ))
}
#endif
