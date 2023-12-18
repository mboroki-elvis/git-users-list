import Foundation

public enum KeychainKey: String, CaseIterable {

    /**
     * The access token obtained after a successful authentication.
     */
    case accessToken

    /**
     * The state used to validate signin.
     */
    case authState
}
