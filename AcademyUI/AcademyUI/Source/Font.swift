import Foundation
import SwiftUI

public enum FontSize: CGFloat {
    /// 32 pts
    case title1 = 32
    /// 26 pts
    case title2 = 26
    /// 19 pts
    case large = 19
    /// 14 pts
    case regular = 14
    /// 11 pts
    case small = 11
    /// 9 pts
    case tiny = 9
}

public enum FontType: String {
    case medium = "SharpSans-Medium"
    case bold = "SharpSans-Bold"
    case ocrB = "OcrB-Regular"

    /// Creates a Font object based on font name and size.
    public func toFont(sized fontSize: FontSize) -> Font {
        return toFont(sized: fontSize.rawValue)
    }

    public func toFont(sized fontSize: CGFloat) -> Font {
        return Font.custom(rawValue, size: fontSize)
    }
}

extension Font {
    public static func registerCustomFonts() {
        let frameworkBundle = BundleProvider.currentBundle
        registerFont(named: "\(FontType.ocrB.rawValue).ttf", in: frameworkBundle)
        registerFont(named: "\(FontType.bold.rawValue).otf", in: frameworkBundle)
        registerFont(named: "\(FontType.medium.rawValue).otf", in: frameworkBundle)
    }

    public static func registerFont(named fontName: String, in frameworkBundle: Bundle) {
        guard let pathForResourceString = frameworkBundle.path(forResource: fontName, ofType: nil),
              let fontData = NSData(contentsOfFile: pathForResourceString),
              let dataProvider = CGDataProvider(data: fontData),
              let fontRef = CGFont(dataProvider) else {
            print("Unable to construct font data for font named \(fontName) in bundle \(frameworkBundle)")
            return
        }

        var errorRef: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) {
            print("CTFontManagerRegisterGraphicsFont failed - this font may have already been registered in the bundle.")
        }
    }

    static func custom(_ name: FontType, size: FontSize) -> Font {
        return Font.custom(name.rawValue, size: size.rawValue)
    }
}
