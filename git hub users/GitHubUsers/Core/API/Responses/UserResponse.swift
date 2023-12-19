import Foundation

struct UserResponse: Codable, Equatable, Identifiable, Hashable {
    static func == (lhs: UserResponse, rhs: UserResponse) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarURL = "avatar_url"
    }

    let login: String
    let id: Int
    let avatarURL: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension UserResponse {
    static let `default` = UserResponse(
        login: "",
        id: -1,
        avatarURL: ""
    )
}
