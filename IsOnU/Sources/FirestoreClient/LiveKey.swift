import Dependencies
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import Models

public extension FirestoreClient {
    static let live: Self = .init(
        createRoom: { room in
            try Firestore.firestore().collection("rooms").addDocument(from: room)
        },
        addUser: { roomId, userProperty, userId in
            try Firestore.firestore().collection("rooms").document(roomId.uuidString).collection(userProperty.rawValue).addDocument(from: User(id: userId))
        },
        getRoomData: { room in
            try await Firestore.firestore().collection("rooms").document(room).getDocument(as: Room.self)
        }
    )
}

extension FirestoreClient: DependencyKey {
    public static let liveValue: Self = .live
}
