import SwiftUI

struct UserListView: View {
    @Bindable var viewModel = UsersViewModel()

    var body: some View {
        ContainerView(error: viewModel.error) {
            viewModel.error = nil
        } content: {
            List {
                ForEach(viewModel.users) { user in
                    UserListItemView(user: user)
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
            viewModel.fetchData()
        }
        .refreshable {
            viewModel.fetchData()
        }
    }
}

#Preview {
    UserListView()
}
