import Foundation

public struct Room: Identifiable, Equatable {
    public let id: UUID
    var password: String?
    var displayName: String
    var speaker: User
    var activeMembers: [User]
    var activeAudiences: [User]
    var themeColor: ThemeColor?
    var timerSeconds: Int
    var timerStartedAt: Date?

    public init(
        id: UUID,
        password: String? = nil,
        displayName: String,
        speaker: User,
        activeMembers: [User],
        activeAudiences: [User],
        themeColor: ThemeColor? = nil,
        timerSeconds: Int,
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
extension Room {
    static let example0: Self = .init(
        id: .init(),
        displayName: "SpaJam 2023 第6回予選 トロ寿司",
        speaker: User.example0,
        activeMembers: User.examples1,
        activeAudiences: User.examples2,
        themeColor: .red,
        timerSeconds: 300
    )
}
#endif
