import Foundation

public protocol KeychainManager {

    /**
     * A method used to write a string value to a specified `KeychainKey` case.
     */
    func set(_ string: String, for key: KeychainKey)

    /**
     * A method used to read a string value from a specified `KeychainKey` case.
     * If none exists, return `nil`.
     */
    func string(forKey key: KeychainKey) -> String?

    /**
     * A method used to delete the string value at a specified `KeychainKey` case.
     */
    func remove(forKey key: KeychainKey)

    /**
     * A method used to delete the string value for multiple specified `KeychainKey` cases.
     */
    func remove(forKeys keys: KeychainKey...)

    /**
     * A method used to delete the persisted values for all `KeychainKey` cases.
     */
    func removeAll()
}
