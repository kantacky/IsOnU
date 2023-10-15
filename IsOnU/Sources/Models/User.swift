import Foundation

public struct User: Identifiable, Equatable, Codable {
    public let id: String

    public init(id: String) {
        self.id = id
    }
}

public enum UserProperty: String, Equatable, Codable {
    case audience, member, speaker

    public var collectionName: String {
        switch self {
        case .audience:
            return "activeAudiences"

        case .member:
            return "activeMembers"

        case .speaker:
            return "speaker"
        }
    }
}

#if DEBUG
public extension User {
    static let example0: Self = .init(id: UUID().uuidString)
    static let example1: Self = .init(id: UUID().uuidString)
    static let example2: Self = .init(id: UUID().uuidString)
    static let example3: Self = .init(id: UUID().uuidString)
    static let example4: Self = .init(id: UUID().uuidString)
    static let example5: Self = .init(id: UUID().uuidString)
    static let example6: Self = .init(id: UUID().uuidString)
    static let example7: Self = .init(id: UUID().uuidString)

    static let examples0: [Self] = [Self.example0]
    static let examples1: [Self] = [Self.example1, Self.example2, Self.example3]
    static let examples2: [Self] = [Self.example4, Self.example5, Self.example6, Self.example7]
}
#endif
