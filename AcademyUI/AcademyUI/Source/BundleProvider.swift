import Foundation

internal class BundleProvider {
    private init() { }

    static var currentBundle: Bundle {
        return Bundle(for: self)
    }
}
