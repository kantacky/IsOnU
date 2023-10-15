import Assets
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
        IfLetStore(self.store.scope(state: \.$roomSpeaker, action: { .roomSpeaker($0) })) { store in
            RoomSpeakerView(store: store)
        } else: {
            VStack {
                ZStack {
                    TimerTimePicker(minutes: self.viewStore.binding(
                        get: \.timerMinutes,
                        send: { .onTimerMinutesChanged($0) }
                    ), color: self.viewStore.room.themeColor?.color ?? ColorAssets.pink)

                    VStack {
                        OriginalButton("スタート", color: self.viewStore.room.themeColor?.color ?? ColorAssets.pink) {
                            self.viewStore.send(.onStartButtonTapped)
                        }
                        .frame(maxWidth: 300)
                        .padding(.top, 240)
                    }

                    VStack {
                        HStack {
                            ShareLink(item: .init(string: "https://isonu.kantacky.com/rooms/\(self.viewStore.room.id)?as=member")!) {
                                HStack {
                                    Text("メンバー")
                                        .font(.system(size: 18))
                                        .bold()

                                    Image(systemName: "link")
                                }
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundStyle(ColorAssets.buttonFont)
                                .background(ColorAssets.primaryButtonBackground)
                                .clipShape(Capsule())
                                .shadow(color: ColorAssets.shadow, radius: 4, x: 0, y: 4)
                            }

                            ShareLink(item: .init(string: "https://isonu.kantacky.com/rooms/\(self.viewStore.room.id)?as=audience")!) {
                                HStack {
                                    Text("オーディエンス")
                                        .font(.system(size: 18))
                                        .bold()

                                    Image(systemName: "link")
                                }
                                .frame(maxWidth: .infinity, maxHeight: 60)
                                .foregroundStyle(ColorAssets.buttonFont)
                                .background(ColorAssets.primaryButtonBackground)
                                .clipShape(Capsule())
                                .shadow(color: ColorAssets.shadow, radius: 4, x: 0, y: 4)
                            }
                        }
                        .padding(.top, 480)
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
    }
}

#if DEBUG
#Preview {
    RoomSettingsView(store: Store(
        initialState: RoomSettingsView.Reducer.State(room: .example0),
        reducer: { RoomSettingsView.Reducer() }
    ))
}
#endif
