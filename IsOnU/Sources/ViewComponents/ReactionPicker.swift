import Assets
import Models
import SwiftUI

public struct ReactionPicker: View {
    private let circleRadius: CGFloat
    private let circleCenterY: CGFloat
    private let numberOfReactions: Int

    let twoTimesPi: CGFloat
    let aAngle: CGFloat

    @State private var rotationAngle: CGFloat
    @State private var previousRotationAngle: CGFloat
    @State private var selectedReactionIndex: Int

    public init() {
        self.circleRadius = UIScreen.main.bounds.width * 1.5 / 2
        self.circleCenterY = UIScreen.main.bounds.height / 1.8
        self.numberOfReactions = Reaction.allCases.count * 3

        self.twoTimesPi = CGFloat.pi * CGFloat(2)
        self.aAngle = self.twoTimesPi / CGFloat(self.numberOfReactions)

        self.rotationAngle = 0
        self.previousRotationAngle = 0
        self.selectedReactionIndex = 0
    }

    public var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundStyle(ColorAssets.background)
                    .frame(width: self.circleRadius * 2)
                    .shadow(radius: 30)

                ForEach(0..<self.numberOfReactions) { i in
                    Reaction.allCases[i % Reaction.allCases.count].image
                        .resizable()
                        .scaledToFit()
                        .frame(width: self.selectedReactionIndex == i ? 120 : 60)
                        .rotationEffect(Angle(radians: CGFloat.pi / 2 - self.rotationAngle))
                        .offset(
                            x: self.circleRadius * cos(self.twoTimesPi / CGFloat(self.numberOfReactions) * CGFloat(i)),
                            y: self.circleRadius * sin(self.twoTimesPi / CGFloat(self.numberOfReactions) * CGFloat(i))
                        )
                }
            }
            .rotationEffect(Angle(radians: self.rotationAngle - CGFloat.pi / CGFloat(2)))
            .offset(y: self.circleCenterY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.rotationAngle = self.previousRotationAngle + value.translation.width * 0.01
                        self.selectedReactionIndex = (self.selectedReactionIndex + Int((self.previousRotationAngle - self.rotationAngle) / aAngle) + self.numberOfReactions) % self.numberOfReactions
                    }
                    .onEnded { value in
                        self.rotationAngle = -CGFloat(self.selectedReactionIndex) * aAngle
                        self.previousRotationAngle = self.rotationAngle
                    }
            )
        }
    }
}

#Preview {
    ReactionPicker()
}
