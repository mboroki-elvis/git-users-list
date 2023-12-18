import Foundation

protocol UsersService: AnyObject {
    func getUsers(since id: Int) async throws -> [UserResponse]
    func getUserDetails(for name: String) async throws -> UserDetailsResponse
}

final class UsersServiceImplementation: UsersService {
    private var environment: AppEnvironment
    init(environment: AppEnvironment = EnvironmentAuthenticated()) {
        self.environment = environment
    }

    func getUsers(since id: Int) async throws -> [UserResponse] {
        let request = UsersRequest(since: id)
        if let users = try await request.doRequest(environment: environment) {
            return users
        }
        throw UsersError.unAuthorized
    }

    func getUserDetails(for name: String) async throws -> UserDetailsResponse {
        let request = UserDetailsRequest(username: name)
        if let response = try await request.doRequest(environment: environment) {
            return response
        }
        throw UsersError.unAuthorized
    }
}

extension UsersServiceImplementation {
    enum UsersError: LocalizedError {
        case unAuthorized
        var errorDescription: String? {
            switch self {
            case .unAuthorized:
                return "authorization error"
            }
        }
    }
}
