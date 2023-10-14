import Assets
import ComposableArchitecture
import SwiftUI
import ViewComponents

struct CoreView: View {
    typealias Reducer = CoreReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    var body: some View {
        VStack {
            TimerTimePicker(minutes: 15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorAssets.background)
        .foregroundStyle(ColorAssets.primaryFont)
        .onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
            guard let url = userActivity.webpageURL else {
                return
            }
            self.viewStore.send(.onOpenURL(url))
        }
        .onOpenURL { url in
            self.viewStore.send(.onOpenURL(url))
        }
    }
}

#Preview {
    CoreView(store: Store(
        initialState: CoreView.Reducer.State(),
        reducer: { CoreView.Reducer() }
    ))
}
