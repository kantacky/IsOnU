import Dependencies

extension FirestoreClient: TestDependencyKey {
    public static let testValue: FirestoreClient = .init(
        createRoom: unimplemented("createRoom"),
        addUser: unimplemented("addUser"),
        getRoomData: unimplemented("getRoomData")
    )
}
