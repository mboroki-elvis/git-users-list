import SwiftUI

enum Routes: Hashable {
    case auth(Auth)
    case authenticated(Authenticated)
    enum Auth: Hashable {
        case authorize
        case token(URL)
        case authenticating(URL)
    }

    enum Authenticated: Hashable {
        case users
        case userDetails(String)
    }
}

typealias AppRouter = Router<Routes>

struct AppCoordinator: View {
    @Environment(AppRouter.self) private var router: AppRouter

    // MARK: - UI

    var body: some View {
        RouterStackView(router: router, viewForRoute: viewForRoute)
    }

    @ViewBuilder private func viewForRoute(_ route: Routes) -> some View {
        switch route {
        case .auth(let route):
            AuthenticationCoordinator(routes: route)
        case .authenticated(let route):
            UsersCoordinator(routes: route)
        }
    }
}
