import Foundation

struct EnvironmentMock: AppEnvironment {
    var client: NetworkClient { NetworkClientImpl(environment: self) }
    var headers: HTTPHeaders { [ : ] }
    var apiEnronment: ApiEnvironment { .mock }
    var clientID: String { "" }
    var imageURL: String { "" }
    var baseURL: String { "" }
    let keychainManager: KeychainManager = KeychainManagerMock()
}
