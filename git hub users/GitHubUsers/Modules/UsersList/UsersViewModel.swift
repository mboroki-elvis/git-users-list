import Foundation
import Observation

@Observable final class UsersViewModel {
    var isLoading = false
    var error: LocalizedError?

    private(set) var users = [UserResponse]()
    private let service: UsersService

    init(service: UsersService = UsersServiceImplementation()) {
        self.service = service
    }

    func fetchData(isRefreshing: Bool = false) {
        Task {
            do {
                defer { self.isLoading = false }
                self.isLoading = true
                if isRefreshing {
                    self.users.removeAll()
                }
                let lastID: Int? = users.isEmpty ? .zero : users.last?.id
                let users = try await service.getUsers(since: lastID ?? .zero)
                self.users.append(contentsOf: users)
            } catch {
                self.error = error.toLocalizeError
            }
        }
    }
}

extension Error {
    var toLocalizeError: LocalizedError? {
        self as? LocalizedError
    }
}
