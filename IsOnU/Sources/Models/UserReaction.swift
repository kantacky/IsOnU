import Foundation

public struct UserReaction: Identifiable, Equatable, Codable {
    public let id: UUID
    public let userProperty: UserProperty
    public let reaction: Reaction

    public init(
        id: UUID = .init(),
        userProperty: UserProperty,
        reaction: Reaction
    ) {
        self.id = id
        self.userProperty = userProperty
        self.reaction = reaction
    }
}
