import Foundation
import FirebaseAuth
import FirebaseError

public extension AnonymousClient {
    static let live: AnonymousClient = Self(
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
