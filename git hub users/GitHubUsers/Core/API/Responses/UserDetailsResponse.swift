import Foundation

// MARK: - UserDetailsResponse
struct UserDetailsResponse: Codable {
    var login: String
    var id: Int
    var nodeID: String
    var avatarURL: String
    let name: String
    let blog: String
    var location, email: String?
    var bio: String?
    let followers, following: Int
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case name, blog, location, email, bio
        case followers, following
        case createdAt = "created_at"
    }
}
