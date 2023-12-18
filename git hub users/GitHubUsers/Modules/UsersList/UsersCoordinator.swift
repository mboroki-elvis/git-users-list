import SwiftUI

struct UsersCoordinator: View {
    let routes: Routes.Authenticated
    var body: some View {
        viewFor(route: routes)
    }

    @ViewBuilder
    private func viewFor(route: Routes.Authenticated) -> some View {
        switch route {
        case .users:
            UsersListView()
        case .userDetails(let string):
            Text(string)
        }
    }
}
