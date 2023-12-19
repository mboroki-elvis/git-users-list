import SwiftUI
import Kingfisher

struct UserListItemView: View {
    var user: UserResponse
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                KFImage(URL(string: user.avatarURL))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)

                Text(user.login)
                    .font(.headline)
                    .foregroundColor(.onContainer)

                Spacer()
            }
            .padding(SizeTokens.small)
        }
    }
}

#Preview {
    UserListItemView(user: .default, onTap: { })
}
