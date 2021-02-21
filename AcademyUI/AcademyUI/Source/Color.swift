import Foundation
import SwiftUI

extension Color {
    public static var academyPrimary: Color {
        Color("academy_primary", bundle: Bundle(for: BundleProvider.self))
    }

    public static var academyText: Color {
        Color("academy_text", bundle: Bundle(for: BundleProvider.self))
    }

    public static var academySecondaryText: Color {
        Color("academy_text_secondary", bundle: Bundle(for: BundleProvider.self))
    }

    public static var academyBackground: Color {
        Color("academy_background", bundle: Bundle(for: BundleProvider.self))
    }

    public static var academySecondaryBackground: Color {
        Color("academy_background_secondary", bundle: Bundle(for: BundleProvider.self))
    }

    public static var academySurface: Color {
        Color("academy_surface", bundle: Bundle(for: BundleProvider.self))
    }
}
