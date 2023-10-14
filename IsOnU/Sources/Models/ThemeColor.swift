import Assets
import Foundation
import SwiftUI

public enum ThemeColor: Int, Identifiable, Equatable, Codable, CaseIterable {
    case yellow
    case pink
    case blue

    public var color: Color {
        switch self {
        case .yellow:
            return ColorAssets.yellow

        case .pink:
            return ColorAssets.pink

        case .blue:
            return ColorAssets.blue
        }
    }

    public var id: Self { self }
}
