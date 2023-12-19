import Foundation

struct UsersRequest: APIRequest {
    var endpoint: String { GitHubAPI.lists.path }
    
    var method: HTTPMethod { .get }
    var perPage: Int = 30
    var since: Int?
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case since
    }
    var headers: [String: String] = [:]
    func response(environment: AppEnvironment) async throws -> [UserResponse]? {
        switch environment.apiEnronment {
        case .live:
            return nil
        case .mock:
            return [.default]
        case .failing:
            throw APIException.unknownError
        }
    }
}
