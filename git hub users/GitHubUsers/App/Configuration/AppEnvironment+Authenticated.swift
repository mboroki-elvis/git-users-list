import Foundation

struct EnvironmentAuthenticated: AppEnvironment {
    var headers: HTTPHeaders {
        [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
            "Authorization": "Bearer \(keychainManager.string(forKey: .accessToken) ?? "")"
        ]
    }

    let apiEnronment: ApiEnvironment = .live
    let keychainManager: KeychainManager = KeychainManagerImpl.live

    var clientID: String { string(for: .clientID) }
    var baseURL: String { string(for: .apiURL) }
    var client: NetworkClient { NetworkClientImpl(environment: self) }
}
