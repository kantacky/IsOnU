import Assets
import SwiftUI

public struct TimerDisplay: View {
    private let seconds: Int

    public init(seconds: Int) {
        self.seconds = seconds
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
        .foregroundStyle(ColorAssets.pink)
    }
}

#Preview {
    TimerDisplay(seconds: 60 * 15)
}
