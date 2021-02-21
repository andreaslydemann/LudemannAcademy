import Foundation

internal class BundleProvider {
    private init() { }

    static func currentBundle() -> Bundle {
        Bundle(for: self)
    }
}
