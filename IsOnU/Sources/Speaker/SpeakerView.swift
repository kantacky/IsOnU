import ComposableArchitecture
import SwiftUI

public struct SpeakerView: View {
    public typealias Reducer = SpeakerReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        RoomRegistrationView(store: self.store.scope(state: \.roomRegistration, action: { .roomRegistration($0) }))
    }
}

#Preview {
    SpeakerView(store: Store(
        initialState: SpeakerView.Reducer.State(),
        reducer: { SpeakerView.Reducer() }
    ))
}
