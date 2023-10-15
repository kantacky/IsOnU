import Assets
import SwiftUI

public struct OriginalButton: View {
    private let labelText: String
    private let labelImage: Image?
    private let color: Color
    private var action: () -> Void

    public init(
        _ labelText: String,
        labelImage: Image? = nil,
        color: Color,
        action: @escaping () -> Void
    ) {
        self.labelText = labelText
        self.labelImage = labelImage
        self.color = color
        self.action = action
    }

    public var body: some View {
        Button {
            self.action()
        } label: {
            HStack {
                Text(self.labelText)
                    .font(.system(size: 18))
                    .bold()

                if let image = self.labelImage {
                    image
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
        }
        .foregroundStyle(ColorAssets.buttonFont)
        .background(self.color)
        .clipShape(Capsule())
        .shadow(color: ColorAssets.shadow, radius: 4, x: 0, y: 4)
    }
}

#if DEBUG
#Preview {
    VStack(spacing: 21) {
        OriginalButton("Primary Button", color: ColorAssets.primaryButtonBackground) {
            print("Tapped Primary Button")
        }

        OriginalButton("メンバー", labelImage: Image(systemName: "link"), color: ColorAssets.pink) {
            print("Tapped Secondary Button")
        }

        OriginalButton("オーディエンス", labelImage: Image(systemName: "link"), color: ColorAssets.pink) {
            print("Tapped Secondary Button")
        }
    }
    .frame(maxWidth: 300)
}
#endif
