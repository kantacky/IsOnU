import Assets
import ComposableArchitecture
import Models
import SwiftUI
import ViewComponents

public struct RoomRegistrationView: View {
    public typealias Reducer = RoomRegistrationReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        IfLetStore(self.store.scope(state: \.$roomSettings, action: { .roomSettings($0) })) { store in
            RoomSettingsView(store: store)
        } else: {
            ZStack {
                VStack(spacing: 16) {
                    Text("テーマカラー")
                        .font(.system(size: 22))
                        .bold()

                    HStack(spacing: 48) {
                        ForEach(ThemeColor.allCases) { color in
                            ThemeColorBall(color, isSelected: self.viewStore.themeColor == color)
                                .onTapGesture {
                                    self.viewStore.send(.onThemeColorChanged(color), animation: .smooth(duration: 0.3))
                                }
                        }
                    }
                }

                VStack {
                    Spacer()

                    OriginalButton("ルームをつくる", color: ColorAssets.primaryButtonBackground) {
                        self.viewStore.send(.onCreateRoomButtonTapped)
                    }
                    .frame(maxWidth: 300)

                    Spacer()
                        .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    RoomRegistrationView(store: Store(
        initialState: RoomRegistrationView.Reducer.State(),
        reducer: { RoomRegistrationView.Reducer() }
    ))
}

