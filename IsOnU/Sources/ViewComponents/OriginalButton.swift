import Assets
import SwiftUI

public struct OriginalButton: View {
    private let labelText: String
    private let labelImage: Image?
    private let buttonStyle: OriginalButtonStyle
    private var action: () -> Void

    public init(
        _ labelText: String,
        labelImage: Image? = nil,
        buttonStyle: OriginalButtonStyle = .primary,
        action: @escaping () -> Void
    ) {
        self.labelText = labelText
        self.labelImage = labelImage
        self.buttonStyle = buttonStyle
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
        .background(self.buttonStyle.background)
        .clipShape(Capsule())
        .shadow(color: ColorAssets.shadow, radius: 4, x: 0, y: 4)
    }
}

public enum OriginalButtonStyle {
    case primary
    case secondary

    var background: Color {
        switch self {
        case .primary:
            return ColorAssets.primaryButtonBackground

        case .secondary:
            return ColorAssets.secondaryButtonBackground
        }
    }
}

#Preview {
    VStack(spacing: 21) {
        OriginalButton("Primary Button") {
            print("Tapped Primary Button")
        }

        OriginalButton("メンバー", labelImage: Image(systemName: "link"), buttonStyle: .secondary) {
            print("Tapped Secondary Button")
        }

        OriginalButton("オーディエンス", labelImage: Image(systemName: "link"), buttonStyle: .secondary) {
            print("Tapped Secondary Button")
        }
    }
    .frame(maxWidth: 300)
}
