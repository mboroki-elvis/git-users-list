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
            return .init(
                login: "test_login",
                id: -1,
                nodeID: "test_node",
                avatarURL: "test_url",
                name: "test_name",
                blog: "test_blog",
                followers: 1,
                following: 2,
                createdAt: "2023-12-19T06:48:54+0000"
            )
        case .failing:
            throw APIException.unknownError
        }
    }
}
