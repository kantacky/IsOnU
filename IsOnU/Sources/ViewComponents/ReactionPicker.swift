import Assets
import Models
import SwiftUI

public struct ReactionPicker: View {
    private let circleRadius: CGFloat
    private let circleCenterY: CGFloat

    public init() {
        circleRadius = UIScreen.main.bounds.width * 1.5
        circleCenterY = UIScreen.main.bounds.height / 1.8
    }

    public var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(ColorAssets.background)
                .frame(width: self.circleRadius)
                .shadow(radius: 30)

            HStack {
                ForEach(Reaction.allCases) { reaction in
                    reaction.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                }
            }
            .offset(x: 0, y: self.circleCenterY - self.circleRadius)
        }
        .offset(x: 0, y: self.circleCenterY)
    }
}

#Preview {
    ReactionPicker()
}
