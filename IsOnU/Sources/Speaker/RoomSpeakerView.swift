import Assets
import ComposableArchitecture
import SwiftUI
import ViewComponents

public struct RoomSpeakerView: View {
    public typealias Reducer = RoomSpeakerReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton {
                        self.viewStore.send(.onBackButtonTapped)
                    }
                    .padding()

                    Spacer()
                }

                Spacer()
            }

            // TODO: Reactions

            VStack {
                TimerDisplay(seconds: self.viewStore.room.timerSeconds, color: self.viewStore.room.themeColor?.color ?? ColorAssets.pink)

                if self.viewStore.room.timerSeconds < 1 {
                    OriginalButton("ルームを終了する", color: self.viewStore.room.themeColor?.color ?? ColorAssets.pink) {
                        self.viewStore.send(.onEndTheRoomButtonTapped(self.viewStore.room))
                    }
                }
            }
        }
        .onAppear {
            self.viewStore.send(.onAppear)
        }
        .onDisappear {
            self.viewStore.send(.onDisappear)
        }
    }
}

#Preview {
    RoomSpeakerView(store: Store(
        initialState: RoomSpeakerView.Reducer.State(room: .example0),
        reducer: { RoomSpeakerView.Reducer() }
    ))
}
