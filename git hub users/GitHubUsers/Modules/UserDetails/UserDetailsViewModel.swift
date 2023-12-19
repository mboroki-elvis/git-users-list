import Foundation
import Observation

@Observable final class UserDetailsViewModel {
    var isLoading = false
    var error: LocalizedError?

    private(set) var user: UserResponse
    private(set) var userDetails: UserDetailsResponse?
    private let service: UsersService

    init(service: UsersService = UsersServiceImplementation(), user: UserResponse) {
        self.service = service
        self.user = user
    }

    func fetchData() {
        Task {
            do {
                defer { self.isLoading = false }
                self.isLoading = true
                self.userDetails = try await service.getUserDetails(for: user.login)
            } catch {
                self.error = error.toLocalizeError
            }
        }
    }
}
