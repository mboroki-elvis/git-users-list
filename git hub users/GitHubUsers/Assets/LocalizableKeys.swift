import SwiftUI

enum LocalizableKeys: String {
    case login = "Login you in"
    case loginWith = "login with"
    case error = "Something went wrong!"
    case userDetails = "User Details"
    case following = "Following"
    case followers = "Followers"
    case createdAt = "Account Created:"

    func toLocalizableKey() -> LocalizedStringKey {
        LocalizedStringKey(self.rawValue)
    }

    func localized(args: CVarArg...) -> String {
        let localized = NSLocalizedString(self.rawValue, comment: self.rawValue)
        return String(format: localized, args)
    }
}

extension Text {
    init(with key: LocalizableKeys) {
        self.init(key.toLocalizableKey())
    }

    init(with key: LocalizableKeys, args: CVarArg...) {
        self.init(key.localized(args: args))
    }
}
