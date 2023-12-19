import SwiftUI
import Kingfisher

struct UserListItemView: View {
    var user: UserResponse

    var body: some View {
        HStack {
            KFImage(URL(string: user.avatarURL))
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)

            VStack(alignment: .leading, spacing: SizeTokens.extraSmall) {
                Text(user.login)
                    .font(.headline)
                    .foregroundColor(.onContainer)

                Text(user.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(SizeTokens.small)
    }
}

#Preview {
    UserListItemView(user: .default)
}
