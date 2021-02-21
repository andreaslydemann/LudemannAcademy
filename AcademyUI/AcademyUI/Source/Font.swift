import Foundation
import SwiftUI

extension Font {

    // MARK: - Setup

    static public func loadCustomFonts() {
        if let fontUrl = BundleProvider.currentBundle().url(forResource: "SharpSans-Bold", withExtension: "otf"),
           let dataProvider = CGDataProvider(url: fontUrl as CFURL),
           let newFont = CGFont(dataProvider) {
            var error: Unmanaged<CFError>?
            if !CTFontManagerRegisterGraphicsFont(newFont, &error)
                {
                    print("Error loading Font!")
            } else {
                print("Loaded font")
            }
        } else {
            assertionFailure("Error loading font")
        }
    }

    // MARK: - Fonts

    public static func OcrB(size: CGFloat) -> Font {
        return Font.custom("OcrB-Regular", size: size)
    }

    public static func SharpSansMedium(size: CGFloat) -> Font {
        return Font.custom("SharpSans-Medium", size: size)
    }

    public static func SharpSansBold(size: CGFloat) -> Font {
        return Font.custom("SharpSans-Bold", size: size)
    }
}

struct TitleFont: ViewModifier {
    let size: CGFloat

    func body(content: Content) -> some View {
        return content.font(.SharpSansMedium(size: size))
    }
}

extension View {
    func titleFont(size: CGFloat) -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: size))
    }

    func titleStyle() -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: 16))
    }
}
