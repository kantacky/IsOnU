//
//  File.swift
//
//
//  Created by Keitaro Kawahara on 2023/10/14.
//

import Dependencies
import FirebaseCore
import FirebaseFirestore
import Models
import ComposableArchitecture

public struct FirestoreClient {
    public var createRoom: @Sendable (Room) async throws -> Void
    public var addUser: @Sendable (_ roomID: String, _ userData: User) async throws -> Void
    public var getRoomData: @Sendable (_ roomID: String) async throws -> Room
    public var getUsers: @Sendable (_ roomID: String) async throws -> [User]

    public init(
        createRoom: @Sendable @escaping (Room) async throws -> Void,
        addUser: @Sendable @escaping (
            _ roomID: String,
            _ userData: User
        ) async throws -> Void,
        getRoomData: @Sendable @escaping (
            _ roomID: String
        ) async throws -> Room,
        getUsers: @Sendable @escaping (
            _ roomID: String
        ) async throws -> [User]
    ) {
        self.createRoom = createRoom
        self.addUser = addUser
        self.getRoomData = getRoomData
        self.getUsers = getUsers
    }
}

public extension DependencyValues {
    var firestoreClient: FirestoreClient {
        get { self[FirestoreClient.self] }
        set { self[FirestoreClient.self] = newValue }
    }
}

extension FirestoreClient: TestDependencyKey {
    public static let testValue: FirestoreClient = Self(
        createRoom: unimplemented("createRoom"),
        addUser: unimplemented("addUser"),
        getRoomData: unimplemented("getRoomData"),
        getUsers: unimplemented("getUsers")
    )
}
