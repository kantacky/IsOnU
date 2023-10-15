import Dependencies
import Foundation
import FirebaseAuth
import FirebaseError

public extension AuthClient {
    static let live: Self = .init(
        signinAnonymously: {
            try await withCheckedThrowingContinuation { continuation in
                Auth.auth().signInAnonymously { authResult, error in
                    if let uid = authResult?.user.uid {
                        continuation.resume(returning: uid)
                    } else if let error {
                        continuation.resume(throwing: AuthError(error))
                    }
                }
            }
        }
    )
}

extension AuthClient: DependencyKey {
    public static let liveValue: Self = .live
}
