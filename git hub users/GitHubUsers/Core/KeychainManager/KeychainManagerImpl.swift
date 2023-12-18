import Foundation

public struct KeychainManagerImpl: KeychainManager {

    // MARK: Keychain Errors

    private enum KeychainError: Error {
        case duplicateItem
        case unknown(OSStatus)
    }

    // MARK: Properties

    private let service: String

    // MARK: Initializers

    public init(service: String) {
        self.service = service
    }

    // MARK: - Protocol methods

    public func set(_ string: String, for key: KeychainKey) {

        guard let data = string.data(using: .utf8) else {
            preconditionFailure("String not a valid UTF8 format.")
        }

        do {
            try write(service: service,
                      account: key.rawValue,
                      data: data)
        } catch {
            update(service: service,
                   account: key.rawValue,
                   data: data)
        }
    }

    public func string(forKey key: KeychainKey) -> String? {
        return read(service: service,
                    account: key.rawValue)
    }

    public func remove(forKey key: KeychainKey) {
        return delete(service: service,
                      account: key.rawValue)
    }

    public func remove(forKeys keys: KeychainKey...) {
        keys.forEach(remove)
    }

    public func removeAll() {
        KeychainKey.allCases.forEach(remove)
    }

    // MARK: - Private methods

    private func write(service: String, account: String, data: Data) throws {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service as AnyObject,
            kSecAttrAccount: account as AnyObject,
            kSecValueData: data as AnyObject
        ] as CFDictionary

        let status = SecItemAdd(query, nil)

        if status == errSecDuplicateItem {
            throw KeychainError.duplicateItem
        }
    }

    private func read(service: String, account: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service as AnyObject,
            kSecAttrAccount: account as AnyObject,
            kSecReturnData: kCFBooleanTrue as AnyObject,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var result: AnyObject?
        SecItemCopyMatching(query, &result)

        guard let data = result as? Data else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    private func update(service: String, account: String, data: Data) {

        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service as AnyObject,
            kSecAttrAccount: account as AnyObject
        ] as CFDictionary

        let attributes = [
            kSecValueData: data as AnyObject
        ] as CFDictionary

        SecItemUpdate(query, attributes)
    }

    private func delete(service: String, account: String) {

        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service as AnyObject,
            kSecAttrAccount: account as AnyObject
        ] as CFDictionary

        SecItemDelete(query)
    }

}

public extension KeychainManagerImpl {
    static var live: Self {
        let identifier = Bundle.main.bundleIdentifier ?? "com.kwetu.gitusers"
        return .init(service: identifier)
    }
}
