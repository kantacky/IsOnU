import Assets
import Foundation
import SwiftUI

public enum ThemeColor: Equatable, Codable {
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
}
