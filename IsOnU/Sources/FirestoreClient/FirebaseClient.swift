import Dependencies
import FirebaseCore
import FirebaseFirestore
import Models
import ComposableArchitecture

public struct FirestoreClient {
    public var getRoom: @Sendable (_ roomId: UUID) async throws -> Room
    public var createRoom: @Sendable (_ room: Room) async throws -> Void
    public var addUser: @Sendable (_ roomId: UUID, _ userProperty: UserProperty, _ userId: UUID) async throws -> Void

    public init(
        getRoom: @Sendable @escaping (
            _ roomId: UUID
        ) async throws -> Room,
        createRoom: @Sendable @escaping (
            Room
        ) async throws -> Void,
        addUser: @Sendable @escaping (
            _ roomId: UUID,
            _ userProperty: UserProperty,
            _ userId: UUID
        ) async throws -> Void
    ) {
        self.getRoom = getRoom
        self.createRoom = createRoom
        self.addUser = addUser
    }
}

public extension DependencyValues {
    var firestoreClient: FirestoreClient {
        get { self[FirestoreClient.self] }
        set { self[FirestoreClient.self] = newValue }
    }
}
