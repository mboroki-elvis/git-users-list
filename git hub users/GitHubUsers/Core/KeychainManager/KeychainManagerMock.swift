final class KeychainManagerMock: KeychainManager {

    // MARK: - Properties

    var storedKeys: [String: String] = [:]

    // MARK: - Init
    public init() {
        set("mock", for: .accessToken)
        set("mock", for: .authState)
    }

    // MARK: - Protocol Methods

    public func set(_ string: String, for key: KeychainKey) {
        storedKeys[key.rawValue] = string
    }

    public func string(forKey key: KeychainKey) -> String? {
        storedKeys[key.rawValue]
    }

    public func remove(forKey key: KeychainKey) {
        storedKeys[key.rawValue] = nil
    }

    public func remove(forKeys keys: KeychainKey...) {
        keys.forEach { storedKeys[$0.rawValue] = nil }
    }

    public func removeAll() {
        storedKeys = [:]
    }
}
