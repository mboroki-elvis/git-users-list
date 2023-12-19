import SwiftUI

struct UserListView: View {
    @Bindable var viewModel = UsersViewModel()
    @Environment(AppRouter.self) private var router: AppRouter
    var body: some View {
        ContainerView(error: viewModel.error) {
            viewModel.error = nil
        } content: {
            List {
                ForEach(viewModel.users) { user in
                    UserListItemView(
                        user: user, onTap: {
                            router.push(.authenticated(.userDetails(user)))
                        }
                    )
                    .onAppear {
                        if user == viewModel.users.last {
                            viewModel.fetchData()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
                    .foregroundStyle(.accent)
            }
            Spacer()
        }
        .background(Color.container)
        .task {
            viewModel.fetchData(isRefreshing: true)
        }
        .refreshable {
            viewModel.fetchData(isRefreshing: true)
        }
        .background(.container)
        .navigationTitle("Github Users")
    }
}

#Preview {
    UserListView()
}
