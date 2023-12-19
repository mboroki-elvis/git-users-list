import SwiftUI

struct LandingView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Bindable var viewModel: AuthenticationViewModel
    var body: some View {
        ContainerView(error: viewModel.error) {
            viewModel.error = nil
        } content: {
            ZStack {
                Color.accentColor.opacity(0.4).ignoresSafeArea()
                VStack {
                    Button(action: {
                        viewModel.startFlow(router: router)
                    }, label: {
                        HStack(spacing: SizeTokens.small) {
                            Text(with: .loginWith)
                            Image("github-mark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                        .padding()
                    })
                    .buttonStyle(AuthButtonStyle())
                }
            }
        }
    }
}

#Preview {
    LandingView(viewModel: AuthenticationViewModel())
        .environment(AppRouter(.auth(.authorize)))
}
