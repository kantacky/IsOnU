import Assets
import SwiftUI

public struct TimerTimePicker: View {
    @State private var minutes: Int
    @State private var offsetY: CGFloat
    @State private var previousOffsetY: CGFloat

    public init(minutes: Int) {
        self.minutes = minutes
        self.offsetY = CGFloat(64 * (50 - minutes) - 32)
        self.previousOffsetY = CGFloat(64 * (50 - minutes) - 32)
    }

    public var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<100) { n in
                    HStack {
                        Text(String(format: "%02d", n))
                        Text(":")
                        Text("00")
                    }
                    .foregroundStyle(n == self.minutes ? ColorAssets.primaryFont : ColorAssets.secondaryFont)
                    .font(.system(size: 50))
                    .frame(height: 64)
                }
            }
            .offset(y: offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if self.offsetY <= CGFloat(64 * (50 - 0) - 32) && self.offsetY >= CGFloat(64 * (50 - 99) - 32) {
                            self.offsetY = self.previousOffsetY + value.translation.height
                            self.minutes = Int(CGFloat(50) - (self.offsetY + CGFloat(32)) / CGFloat(64))
                        }
                    }
                    .onEnded{ value in
                        self.offsetY = CGFloat(64 * (50 - minutes) - 32)
                        self.previousOffsetY = self.offsetY
                    }
            )

            VStack(spacing: 120) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                    .foregroundStyle(ColorAssets.background)

                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
                    .foregroundStyle(ColorAssets.background)
            }
        }
    }
}

#Preview {
    TimerTimePicker(minutes: 15)
}
