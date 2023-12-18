import Foundation

struct AuthDeepLink {
    var scheme: String
    var host: String
    var code: String
    var state: String
}

extension AuthDeepLink {
    init?(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let scheme = components.scheme,
              let host = components.host
        else { return nil }

        self.scheme = scheme
        self.host = host

        let queryItems = components.queryItems
        guard let code = queryItems?.first(where: { $0.name == "code" })?.value else {
            return nil
        }
        self.code = code
        guard let state = queryItems?.first(where: { $0.name == "state" })?.value else {
            return nil
        }
        self.state = state
    }
}
