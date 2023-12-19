import Foundation
import Observation

@Observable final class AuthenticationViewModel {
    var error: LocalizedError?
    private let service: AuthenticationService
    init(service: AuthenticationService = AuthenticationServiceImplementation()) {
        self.service = service
    }

    func startFlow(router: AppRouter) {
        do {
            let url = try service.authorize()
            router.push(.auth(.token(url)), presentationMode: .fullScreen)
        } catch {
            self.error = error.toLocalizeError
        }
    }

    func obtainAccessToken(url: URL, router: AppRouter) {
        guard let model = AuthDeepLink(url: url) else { return }
        Task {
            do {
                try service.statesMatch(state: model.state)
                try await service.getAccessToken(code: model.code)
                router.push(.authenticated(.users), presentationMode: .fullScreen)
            } catch {
                router.push(.auth(.authorize))
            }
        }
    }
}
