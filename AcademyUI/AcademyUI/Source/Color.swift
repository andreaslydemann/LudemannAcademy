import Foundation
import SwiftUI

extension Color {
    // MARK: - Primary

    public static var academyPrimary: Color {
        Color("academy_primary", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Background

    public static var academyBackground: Color {
        Color("academy_background", bundle: BundleProvider.currentBundle)
    }

    public static var academySecondaryBackground: Color {
        Color("academy_background_secondary", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Surface

    public static var academySurface: Color {
        Color("academy_surface", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Text

    public static var academyText: Color {
        Color("academy_text", bundle: BundleProvider.currentBundle)
    }

    public static var academySecondaryText: Color {
        Color("academy_text_secondary", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Button

    public static var academyButtonContent: Color {
        Color("academy_button_content", bundle: BundleProvider.currentBundle)
    }

    public static var academyButtonBackground: Color {
        Color("academy_button_background", bundle: BundleProvider.currentBundle)
    }

    public static var academyButtonSecondaryBackground: Color {
        Color("academy_button_background_secondary", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Positive/Negative

    public static var academyPositive: Color {
        Color("academy_positive", bundle: BundleProvider.currentBundle)
    }

    public static var academyNegative: Color {
        Color("academy_negative", bundle: BundleProvider.currentBundle)
    }

    // MARK: - Attention

    public static var academyAttention: Color {
        Color("academy_attention", bundle: BundleProvider.currentBundle)
    }
}
