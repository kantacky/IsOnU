import Assets
import SwiftUI

public enum Reaction: Int, Identifiable, Equatable, Codable, CaseIterable {
    case applause
    case congrats
    case heart
    case like
    case smile
    case tears

    public var image: Image {
        switch self {
        case .applause:
            return ImageAssets.applause
        case .congrats:
            return ImageAssets.congrats
        case .heart:
            return ImageAssets.heart
        case .like:
            return ImageAssets.like
        case .smile:
            return ImageAssets.smile
        case .tears:
            return ImageAssets.tears
        }
    }

    public var id: Self { self }
}
