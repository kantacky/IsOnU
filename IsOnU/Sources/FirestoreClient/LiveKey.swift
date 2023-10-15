import Dependencies
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import Models

public extension FirestoreClient {
    static let live: Self = .init(
        getRoom: { roomId in
            try await Firestore.firestore().collection("rooms").document(roomId.uuidString).getDocument(as: Room.self)
        },
        createRoom: { room in
            try Firestore.firestore().collection("rooms").document(room.id.uuidString).setData(from: room)
        },
        addUser: { roomId, userProperty, userId in
            try Firestore.firestore().collection("rooms").document(roomId.uuidString).updateData([userProperty.collectionName: FieldValue.arrayUnion([userId])])
        }
    )
}

extension FirestoreClient: DependencyKey {
    public static let liveValue: Self = .live
}
