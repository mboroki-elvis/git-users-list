import Foundation

struct EnvironmentFailing: AppEnvironment {
    var client: NetworkClient { NetworkClientImpl(environment: self) }
    
    var headers: HTTPHeaders { [ : ] }
    var apiEnronment: ApiEnvironment { .failing }
    var clientID: String { "" }
    var baseURL: String { "" }
    let keychainManager: KeychainManager = KeychainManagerMock()
}
