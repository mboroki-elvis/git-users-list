import Foundation

enum GitHubAPI {
    case authorize
    case accessToken
    case lists
    case details(String)
    var path: String {
        switch self {
        case .authorize:
            return "/login/oauth/authorize"
        case .accessToken:
            return "/login/oauth/access_token"
        case .lists:
            return "/user"
        case .details(let name):
            return "/users/\(name)"
        }
    }
}
