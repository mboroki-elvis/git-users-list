import Foundation
import SwiftUI

struct AuthenticationCoordinator: View {
    let routes: Routes.Auth
    @Environment(AppRouter.self) private var router: AppRouter
    var body: some View {
        viewFor(route: routes)
    }

    @ViewBuilder
    private func viewFor(route: Routes.Auth) -> some View {
        switch routes {
        case .authorize:
            LandingView(viewModel: AuthenticationViewModel())
        case .token(let url):
            SafariWebView(url: url).ignoresSafeArea()
                .onOpenURL(perform: { url in
                    router.pop()
                    router.push(.auth(.authenticating(url)))
                })
        case .authenticating(let url):
            AuthenticationView(viewModel: AuthenticationViewModel(), url: url)
        }
    }
}
