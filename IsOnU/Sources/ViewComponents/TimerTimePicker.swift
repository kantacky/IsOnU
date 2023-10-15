import Assets
import SwiftUI

public struct TimerTimePicker: View {
    @Binding private var minutes: Int
    private let color: Color
    @State private var offsetY: CGFloat
    @State private var previousOffsetY: CGFloat

    public init(minutes: Binding<Int>, color: Color) {
        self._minutes = minutes
        self.color = color
        self.offsetY = CGFloat(64 * (50 - minutes.wrappedValue) - 32)
        self.previousOffsetY = CGFloat(64 * (50 - minutes.wrappedValue) - 32)
    }

    public var body: some View {
//        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<100) { n in
                    HStack {
                        Text(String(format: "%02d", n))
                        Text(":")
                        Text("00")
                    }
                    .foregroundStyle(n == self.minutes ? self.color : ColorAssets.secondaryFont)
                    .font(.system(size: 50))
                    .bold(n == self.minutes)
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

//            VStack(spacing: 120) {
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
//                    .foregroundStyle(ColorAssets.background)
//
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
//                    .foregroundStyle(ColorAssets.background)
//            }
//        }
    }
}

#Preview {
    TimerTimePicker(minutes: .constant(15), color: ColorAssets.pink)
}
