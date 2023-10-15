import Assets
import SwiftUI

public struct ExpiredView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 64) {
            ImageAssets.smile
                .resizable()
                .scaledToFit()
                .frame(width: 128)

            Text("このルームは終了いたしました。\nありがとうございました！")
                .multilineTextAlignment(.center)
                .lineSpacing(12)
        }
    }
}

#if DEBUG
#Preview {
    ExpiredView()
}
#endif
