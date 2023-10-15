import Foundation

public struct Room: Identifiable, Equatable, Codable {
    public let id: UUID
    public var password: String?
    public var displayName: String
    public var speaker: User
    public var activeMembers: [String]
    public var activeAudiences: [String]
    public var themeColor: ThemeColor?
    public var timerSeconds: Int
    public var timerStartedAt: Date?

    public init(
        id: UUID = .init(),
        password: String? = nil,
        displayName: String = "",
        speaker: User,
        activeMembers: [String] = [],
        activeAudiences: [String] = [],
        themeColor: ThemeColor? = nil,
        timerSeconds: Int = 60 * 15,
        timerStartedAt: Date? = nil
    ) {
        self.id = id
        self.password = password
        self.displayName = displayName
        self.speaker = speaker
        self.activeMembers = activeMembers
        self.activeAudiences = activeAudiences
        self.themeColor = themeColor
        self.timerSeconds = timerSeconds
    }
}

#if DEBUG
public extension Room {
    static let example0: Self = .init(
        id: .init(),
        displayName: "SpaJam 2023 第6回予選 トロ寿司",
        speaker: User.example0,
        activeMembers: User.examples1.map { $0.id },
        activeAudiences: User.examples2.map { $0.id },
        themeColor: .pink,
        timerSeconds: 300
    )
}
#endif
