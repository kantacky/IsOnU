import Assets
import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct RoomMemberView: View {
    public typealias Reducer = RoomMemberReducer
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

            TimerDisplay(seconds: self.viewStore.room.timerSeconds, color: self.viewStore.room.themeColor?.color ?? ColorAssets.pink)
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
    RoomMemberView(store: Store(
        initialState: RoomMemberView.Reducer.State(room: .example0),
        reducer: { RoomMemberView.Reducer() }
    ))
}
#endif
