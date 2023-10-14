import Assets
import Models
import SwiftUI

public struct ThemeColorBall: View {
    private let themeColor: ThemeColor
    private let isSelected: Bool

    public init(_ themeColor: ThemeColor, isSelected: Bool = false) {
        self.themeColor = themeColor
        self.isSelected = isSelected
    }

    public var body: some View {
        if self.isSelected {
            ZStack {
                Circle()
                    .foregroundStyle(self.themeColor.color)
                    .frame(width: 107, height: 107)

                Image(systemName: "checkmark")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(ColorAssets.buttonFont)
            }
        } else {
            Circle()
                .foregroundStyle(self.themeColor.color)
                .frame(width: 56, height: 56)
        }
    }
}

#Preview {
    HStack(spacing: 47) {
        ThemeColorBall(.yellow)
        ThemeColorBall(.pink, isSelected: true)
        ThemeColorBall(.blue)
    }
}
