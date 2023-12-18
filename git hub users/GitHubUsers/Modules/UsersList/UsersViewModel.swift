import Foundation
import Observation

@Observable final class UsersViewModel {
    private(set) var users = [UserResponse]()
    private let service: UsersService
    var error: LocalizedError?
    init(service: UsersService = UsersServiceImplementation()) {
        self.service = service
    }

    func onAppear() {
        Task {
            do {
                let lastID: Int? = users.isEmpty ? .zero : users.last?.id
                self.users = try await service.getUsers(since: lastID ?? .zero)
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
