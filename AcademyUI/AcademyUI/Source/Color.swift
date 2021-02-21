import Foundation
import SwiftUI

extension Color {
    public static var academyPrimary: Color {
        Color("academy_primary", bundle: BundleProvider.currentBundle)
    }

    public static var academyText: Color {
        Color("academy_text", bundle: BundleProvider.currentBundle)
    }

    public static var academySecondaryText: Color {
        Color("academy_text_secondary", bundle: BundleProvider.currentBundle)
    }

    public static var academyBackground: Color {
        Color("academy_background", bundle: BundleProvider.currentBundle)
    }

    public static var academySecondaryBackground: Color {
        Color("academy_background_secondary", bundle: BundleProvider.currentBundle)
    }

    public static var academySurface: Color {
        Color("academy_surface", bundle: BundleProvider.currentBundle)
    }
}
