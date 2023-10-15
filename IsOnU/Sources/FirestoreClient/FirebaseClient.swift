import Dependencies
import FirebaseCore
import FirebaseFirestore
import Models
import ComposableArchitecture

public struct FirestoreClient {
    public var createRoom: @Sendable (_ room: Room) async throws -> Void
    public var addUser: @Sendable (_ roomId: UUID, _ userProperty: UserProperty, _ userId: UUID) async throws -> Void
    public var getRoomData: @Sendable (_ roomID: String) async throws -> Room

    public init(
        createRoom: @Sendable @escaping (
            Room
        ) async throws -> Void,
        addUser: @Sendable @escaping (
            _ roomId: UUID,
            _ userProperty: UserProperty,
            _ userId: UUID
        ) async throws -> Void,
        getRoomData: @Sendable @escaping (
            _ roomID: String
        ) async throws -> Room
    ) {
        self.createRoom = createRoom
        self.addUser = addUser
        self.getRoomData = getRoomData
    }
}

public extension DependencyValues {
    var firestoreClient: FirestoreClient {
        get { self[FirestoreClient.self] }
        set { self[FirestoreClient.self] = newValue }
    }
}
