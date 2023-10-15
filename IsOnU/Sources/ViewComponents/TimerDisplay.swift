import Assets
import SwiftUI

public struct TimerDisplay: View {
    private let seconds: Int
    private let color: Color

    public init(seconds: Int, color: Color) {
        self.seconds = seconds
        self.color = color
    }

    public var body: some View {
        HStack(spacing: 2) {
            HStack(spacing: 2) {
                Text("\(seconds / 60 / 10)")
                Text("\(seconds / 60 % 10)")
            }

            Text(":")

            HStack(spacing: 2) {
                Text("\(seconds % 60 / 10)")
                Text("\(seconds % 60 % 10)")
            }
        }
        .font(.system(size: 80, design: .monospaced))
        .bold()
        .foregroundStyle(self.color)
    }
}

#if DEBUG
#Preview {
    TimerDisplay(seconds: 60 * 15, color: ColorAssets.pink)
}
#endif
