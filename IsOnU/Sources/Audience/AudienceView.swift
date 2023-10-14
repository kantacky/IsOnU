import ComposableArchitecture
import SwiftUI

public struct AudienceView: View {
    public typealias Reducer = AudienceReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        Text("Audience")
    }
}

#Preview {
    AudienceView(store: Store(
        initialState: AudienceView.Reducer.State(),
        reducer: { AudienceView.Reducer() }
    ))
}

