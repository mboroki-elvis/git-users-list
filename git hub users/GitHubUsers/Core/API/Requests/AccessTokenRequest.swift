import Foundation

struct AccessTokenRequest: APIRequest {
    var endpoint: String { GitHubAPI.accessToken.path }

    var method: HTTPMethod { .post }

    var headers: [String: String] = [:]
    let clientId: String
    let redirectUrl: String
    let clientSecret: String
    let code: String

    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case redirectUrl = "redirect_uri"
        case clientSecret = "client_secret"
        case code
    }

    func response(environment: AppEnvironment) async throws -> AccessTokenResponse? {
        switch environment.apiEnronment {
        case .live:
            return nil
        case .mock:
            return nil
        case .failing:
            throw APIException.unknownError
        }
    }
}
