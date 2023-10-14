import Foundation

public struct User: Identifiable, Equatable, Codable {
    public let id: UUID

    public init(id: UUID) {
        self.id = id
    }
}

#if DEBUG
extension User {
    static let example0: Self = .init(id: .init())
    static let example1: Self = .init(id: .init())
    static let example2: Self = .init(id: .init())
    static let example3: Self = .init(id: .init())
    static let example4: Self = .init(id: .init())
    static let example5: Self = .init(id: .init())
    static let example6: Self = .init(id: .init())
    static let example7: Self = .init(id: .init())

    static let examples0: [Self] = [Self.example0]
    static let examples1: [Self] = [Self.example1, Self.example2, Self.example3]
    static let examples2: [Self] = [Self.example4, Self.example5, Self.example6, Self.example7]
}
#endif
