import Foundation

// MARK: - UserListData
struct UserListData: Codable {
    let page, perPage, total, totalPages: Int
    let data: [UserData]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - UserData class
struct UserData: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}

struct SingleUserData: Codable {
    let data: UserData
    let support: Support
}

struct AddUserData: Codable {
    let name: String
    let job: String
}

struct AddUserResponse: Codable {
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

struct UserRegiser: Codable {
    let email: String
    let password: String
}

struct RegisterResponse : Codable {
    let token: String?
    enum CodingKeys: String,CodingKey {
        case token = "token"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }
}
