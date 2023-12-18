import Foundation
import Observation

@Observable final class AppViewModel {
    private let keychain: KeychainManager
    var router = AppRouter(.auth(.authorize))
    init(keychain: KeychainManager = KeychainManagerImpl.live) {
        self.keychain = keychain
    }

    func checkAuthenticationStatus() {
        if keychain.string(forKey: .accessToken) != nil {
            router.push(.authenticated(.users), presentationMode: .fullScreen)
        } else {
            router.push(.auth(.authorize), presentationMode: .fullScreen)
        }
    }
}
