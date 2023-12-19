import SwiftUI
import Kingfisher

struct UserListItemView: View {
    var user: UserResponse

    var body: some View {
        HStack {
            // Avatar Image (Replace 'Image("placeholder")' with your actual image)
            KFImage(URL(string: user.avatarURL))
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(25)

            VStack(alignment: .leading, spacing: 5) {
                // Login (Title)
                Text(user.login)
                    .font(.headline)
                    .foregroundColor(.onContainer)

                // Name (Subtitle)
                Text(user.name ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer() // Add spacer to push the content to the leading edge
        }
        .padding(8)
    }
}

#Preview {
    UserListItemView(user: .default)
}
