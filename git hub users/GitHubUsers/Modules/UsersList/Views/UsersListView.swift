import SwiftUI

struct UserListView: View {
    @Bindable var viewModel = UsersViewModel()

    var body: some View {
        ContainerView(error: viewModel.error) {
            viewModel.error = nil
        } content: {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.users) { user in
                        UserListItemView(user: user)
                            .onAppear {
                                if user == viewModel.users.last {}
                            }
                    }
                }.refreshable {}
            }
        }
    }
}

#Preview {
    UserListView()
}
