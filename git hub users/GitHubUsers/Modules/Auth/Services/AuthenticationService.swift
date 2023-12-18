import Foundation

protocol AuthenticationService: AnyObject {
    func authorize() throws -> URL
    func getAccessToken(code: String) async throws
    func statesMatch(state: String) throws
}

final class AuthenticationServiceImplementation: AuthenticationService {
    private var environment: AppEnvironment
    init(environment: AppEnvironment = EnvironmentNonAuthenticated()) {
        self.environment = environment
    }

    func authorize() throws -> URL {
        environment.keychainManager.set(UUID().uuidString, for: .authState)
        guard let state = environment.keychainManager.string(forKey: .authState) else { throw AuthenticationError.invalidState }
        let request = AuthorizeRequest(
            clientId: environment.string(for: .clientID),
            redirectUrl: environment.string(for: .redirecrURI),
            state: state,
            scope: ["repo", "user"].joined(separator: " ")
        )
        if let url = try request.toURLRequest(environment: environment) {
            return url
        }
        throw AuthenticationError.authError
    }

    func getAccessToken(code: String) async throws {
        guard environment.keychainManager.string(forKey: .authState) != nil else { throw AuthenticationError.invalidState }
        defer {
            environment.keychainManager.remove(forKey: .authState)
        }
        let request = AccessTokenRequest(
            clientId: environment.string(for: .clientID),
            redirectUrl: environment.string(for: .redirecrURI),
            clientSecret: environment.string(for: .clientSecret),
            code: code
        )
        if let response = try await request.doRequest(environment: environment) {
            environment.keychainManager.set(response.accessToken, for: .accessToken)
        }
        throw AuthenticationError.requestFailed
    }

    func statesMatch(state: String) throws {
        guard let storedState = environment.keychainManager.string(forKey: .authState),
              state == storedState
        else { throw AuthenticationError.invalidState }
    }
}

extension AuthenticationServiceImplementation {
    enum AuthenticationError: LocalizedError {
        case authError
        case invalidState
        case requestFailed
        var errorDescription: String? {
            switch self {
            case .authError:
                return "authorization error"
            case .invalidState:
                return "Invalid state"
            case .requestFailed:
                return "Request Failed"
            }
        }
    }
}
