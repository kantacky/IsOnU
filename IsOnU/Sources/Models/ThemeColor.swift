import Foundation
import SwiftUI

public enum ThemeColor: Equatable {
    case red
    case blue
    case green
    case yellow
    case orange

    var color: Color {
        switch self {
        case .red:
            return .red

        case .blue:
            return .blue

        case .green:
            return .green

        case .yellow:
            return .yellow

        case .orange:
            return .orange
        }
    }
}
