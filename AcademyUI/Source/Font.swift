import Foundation
import SwiftUI

extension Font {
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
