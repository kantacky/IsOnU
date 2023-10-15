import Assets
import SwiftUI

public struct BackButton: View {
    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        Button {
            self.action()
        } label: {
            Image(systemName: "chevron.backward")
                .font(.system(size: 28))
                .bold()
                .foregroundStyle(ColorAssets.backButton)
        }
    }
}

#if DEBUG
#Preview {
    BackButton {
        print("Tapped")
    }
}
#endif
