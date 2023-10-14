import Foundation
import FirebaseAuth

public struct AuthError: LocalizedError {
    public private(set) var errorDescription: String?

    public init(_ description: String) {
        errorDescription = description
    }

    public func getAuthErrorCode(from error: Error) -> AuthErrorCode.Code? {
        AuthErrorCode.Code(rawValue: (error as NSError).code)
    }

    public init(_ error: Error) {
        guard let errcd = getAuthErrorCode(from: error) else {
            return
        }
        switch errcd {
        case .networkError:
            errorDescription = "ネットワークエラーが発生しました"
        case .blockingCloudFunctionError:
            errorDescription = "サーバーでエラーが発生しました"
        case .internalError:
            errorDescription = "内部でエラーが発生しました"
        default:
            errorDescription = "不明なエラーが発生しました"
        }
    }
}

/*
参考: https://firebase.google.com/docs/auth/ios/errors?hl=ja
 */
