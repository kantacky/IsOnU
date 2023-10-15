import Assets
import Audience
import ComposableArchitecture
import Member
import Speaker
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
        SwitchStore(self.store) { state in
            switch state {
            case .speaker:
                CaseLet(/Reducer.State.speaker, action: Reducer.Action.speaker) { store in
                    SpeakerView(store: store)
                }

            case .member:
                CaseLet(/Reducer.State.member, action: Reducer.Action.member) { store in
                    MemberView(store: store)
                }

            case .audience:
                CaseLet(/Reducer.State.audience, action: Reducer.Action.audience) { store in
                    AudienceView(store: store)
                }
            }
        }
        .onAppear {
            self.viewStore.send(.onAppear)
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

#if DEBUG
#Preview {
    CoreView(store: Store(
        initialState: CoreView.Reducer.State(),
        reducer: { CoreView.Reducer() }
    ))
}
#endif
