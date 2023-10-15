//
//  File.swift
//
//
//  Created by Keitaro Kawahara on 2023/10/14.
//

import Dependencies
import FirestoreClient
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import Models

public extension FirestoreClient {
    static let live: FirestoreClient = Self(
        createRoom: { room in
            try Firestore.firestore().collection("Rooms").addDocument(from: room)
        },
        addUser: { addUserParams in
            try Firestore.firestore().collection(addUserParams.roomId).addDocument(from: addUserParams.user)
        },
        getRoomData: { room in
            try await Firestore.firestore().collection("Rooms").document(room).getDocument(as: Room.self)
        },
        getUsers: { roomID in
            try await Firestore.firestore().collection("Rooms").document(roomID).collection("Users").getDocuments(source: .default)
                .documents
                .compactMap { try? $0.data(as: User.self) }
        }
    )
}
