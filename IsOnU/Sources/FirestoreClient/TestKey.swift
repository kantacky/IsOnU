import Dependencies

extension FirestoreClient: TestDependencyKey {
    public static let testValue: FirestoreClient = .init(
        getRoom: unimplemented("createRoom"),
        createRoom: unimplemented("addUser"),
        addUser: unimplemented("getRoomData")
    )
}
