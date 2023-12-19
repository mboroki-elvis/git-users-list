import Kingfisher
import SwiftUI

struct UserDetails: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Bindable var viewModel: UserDetailsViewModel
    var body: some View {
        ContainerView(
            error: viewModel.error,
            onDismissError: {
                viewModel.error = nil
            }
        ) {
            ParallaxView {
                header
            } content: {
                content
            }
        }
        .background(Color.container)
        .task {
            viewModel.fetchData()
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        ZStack(alignment: .topLeading) {
            KFImage(URL(string: viewModel.user.avatarURL))
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .shimmering(active: viewModel.isLoading)

            HStack {
                Button(action: {
                    router.pop()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.headline)

                    Text(with: .userDetails)
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                })

                Spacer()
            }
            .padding(.horizontal, SizeTokens.small)
            .padding(.trailing, SizeTokens.regular)
            .offset(y: 60)
        }
        .ignoresSafeArea()
    }

    private var content: some View {
        // Content Overlay
        VStack(alignment: .leading, spacing: SizeTokens.regular) {
            // Name
            Text(viewModel.userDetails?.name ?? "")
                .font(.title)
                .padding(.top, SizeTokens.small)
                .shimmering(active: viewModel.isLoading)

            // Email
            if let email = viewModel.userDetails?.email {
                Text(email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .shimmering(active: viewModel.isLoading)
            }

            // Following and Followers Count
            HStack {
                VStack {
                    Text(with: .following)
                        .font(.headline)
                        .shimmering(active: viewModel.isLoading)
                    Text("\(viewModel.userDetails?.following ?? .zero)")
                        .font(.subheadline)
                        .foregroundColor(.accent)
                        .shimmering(active: viewModel.isLoading)
                }

                Spacer()

                VStack {
                    Text(with: .followers)
                        .font(.headline)
                        .shimmering(active: viewModel.isLoading)
                    Text("\(viewModel.userDetails?.followers ?? .zero)")
                        .font(.subheadline)
                        .foregroundColor(.accent)
                        .shimmering(active: viewModel.isLoading)
                }
            }
            .padding(.top, SizeTokens.regular)

            // Account Created Date
            if let date = viewModel.userDetails?.createdAt.formattedDate?.toReadableDateString {
                Text(
                    with: .createdAt,
                    args: date
                )
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, SizeTokens.small)
                .shimmering(active: viewModel.isLoading)
            }


            Spacer()
        }
        .background(Color.container)
        .padding(.horizontal, SizeTokens.regular)
    }
}

#Preview {
    UserDetails(viewModel: .init(user: .default))
}
