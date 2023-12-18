import Foundation

struct UserDetailsRequest: APIRequest {
    var endpoint: String { GitHubAPI.details(username).path }

    var method: HTTPMethod { .get }

    var headers: [String: String] = [:]
    let username: String
    init(username: String) {
        self.username = username
    }

    enum CodingKeys: CodingKey {
        case username
    }

    func response(environment: AppEnvironment) async throws -> UserDetailsResponse? {
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
