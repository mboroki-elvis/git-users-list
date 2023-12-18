import Foundation

struct AuthorizeRequest: Codable {
    let clientId: String
    let redirectUrl: String
    let state: String
    let scope: String
    let allowSignup = true

    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case redirectUrl = "redirect_uri"
        case state
        case scope
        case allowSignup = "allow_signup"
    }

    func toURLRequest(environment: AppEnvironment) throws -> URL? {
        return try environment.client.urlRequest(
            endpoint: GitHubAPI.authorize.path,
            method: .get,
            headers: [:],
            body: nil,
            queryParams: convertToQueryParameters()
        ).url
    }
}
