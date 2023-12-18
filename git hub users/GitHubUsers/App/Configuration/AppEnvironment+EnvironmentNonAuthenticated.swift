import Foundation

struct EnvironmentNonAuthenticated: AppEnvironment {
    var client: NetworkClient { NetworkClientImpl(environment: self) }
    let keychainManager: KeychainManager = KeychainManagerImpl.live

    var headers: HTTPHeaders { ["Accept": "application/json"] }

    var apiEnronment: ApiEnvironment { .live }
    var clientID: String { string(for: .clientID) }
    var baseURL: String { string(for: .authenticationURL) }
}
