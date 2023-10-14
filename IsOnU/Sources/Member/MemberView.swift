import ComposableArchitecture
import SwiftUI

public struct MemberView: View {
    public typealias Reducer = MemberReducer
    private let store: StoreOf<Reducer>
    @StateObject private var viewStore: ViewStoreOf<Reducer>

    public init(store: StoreOf<Reducer>) {
        self.store = store
        self._viewStore = .init(wrappedValue: ViewStore(store, observe: { $0 }))
    }

    public var body: some View {
        Text("Member")
    }
}

#Preview {
    MemberView(store: Store(
        initialState: MemberView.Reducer.State(),
        reducer: { MemberView.Reducer() }
    ))
}

