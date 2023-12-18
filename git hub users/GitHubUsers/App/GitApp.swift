import SwiftUI

@main
struct GitApp: App {
    @Bindable private var viewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            AppCoordinator()
                .environment(viewModel.router)
                .onAppear {
                    viewModel.checkAuthenticationStatus()
                }
        }
    }
}
