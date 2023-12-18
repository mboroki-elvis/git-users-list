import Foundation

protocol AppEnvironment {
    var clientID: String { get }
    var baseURL: String { get }
    var apiEnronment: ApiEnvironment { get }
    var headers: HTTPHeaders { get }
    var keychainManager: KeychainManager { get }
    var client: NetworkClient { get }
    func string(for key: EnvironmentKeys) -> String
}

extension AppEnvironment {
    func string(for key: EnvironmentKeys) -> String {
        Bundle.main.infoDictionary?[key.rawValue] as! String
    }
}

enum EnvironmentKeys: String {
    case clientID = "CLIENT_ID"
    case clientSecret = "CLIENT_SECRET"
    case apiURL = "APP_BASE_URL"
    case authenticationURL = "AUTHENTICATION_URL"
    case redirecrURI = "REDIRECT_URI"
}
