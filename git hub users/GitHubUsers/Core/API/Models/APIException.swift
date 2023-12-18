import Foundation

enum APIException: LocalizedError {

    /// Defines a network error. Failing connection for example.
    case networkError(NetworkError)

    /// Fires when there is no access token in keychain
    case invalidApiKey

    /// Defines an unknown error.
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .networkError(let networkError):
            return "Network error \(networkError.localizedDescription)"
        case .invalidApiKey:
            return "Invalid API Key"
        case .unknownError:
            return "Unknown error, please try again"
        }
    }
}
