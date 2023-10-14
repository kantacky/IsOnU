import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct RoomSettingsView: View {
    public typealias Reducer = RoomSettingsReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        ZStack {
            TimerTimePicker(minutes: self.viewStore.binding(
                get: \.timerMinutes,
                send: { .onTimerMinutesChanged($0) }
            ))

            OriginalButton("スタート", buttonStyle: .secondary) {
                self.viewStore.send(.onStartButtonTapped)
            }
            .frame(maxWidth: 300)
            .padding(.top, 240)
        }
    }
}

#Preview {
    RoomSettingsView(store: Store(
        initialState: RoomSettingsView.Reducer.State(room: .example0),
        reducer: { RoomSettingsView.Reducer() }
    ))
}
