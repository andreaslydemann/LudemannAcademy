import SwiftUI

extension Image {
    public init(named: String) {
        self.init(named, bundle: BundleProvider.currentBundle)
    }
}
