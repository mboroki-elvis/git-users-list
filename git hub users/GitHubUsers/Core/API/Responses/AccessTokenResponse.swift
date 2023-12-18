import Foundation

// MARK: - AccessTokenResponse
struct AccessTokenResponse: Codable {
    let accessToken, scope, tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case tokenType = "token_type"
    }
}
