import SwiftUI

struct AuthenticationView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Bindable var viewModel: AuthenticationViewModel
    let url: URL
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
                .foregroundStyle(.accent)

            Text(with: .login)
        }.onAppear {
            viewModel.obtainAccessToken(url: url, router: router)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AuthenticationView(
        viewModel: AuthenticationViewModel(),
        url: URL(string: "www.google.com")!
    )
    .environment(AppRouter(.auth(.authorize)))
}
