import SwiftUI

public enum TextStyle: CaseIterable {
    // title 1
    case title1Bold
    case title1Medium

    // title 2
    case title2Bold
    case title2Medium

    // large
    case largeBold
    case largeMedium
    case largeMediumSecondary

    // regular
    case regularBold
    case regularMedium
    case regularMediumPrimary
    case regularMediumSecondary
    case regularMediumPositive
    case regularMediumNegative

    // small
    case smallBold
    case smallMedium
    case smallMediumPrimary
    case smallMediumSecondary
    case smallMediumPositive
    case smallMediumNegative

    // tiny
    case tinyBold
    case tinyMediumSecondary
}

extension Text {
    public func textStyle(_ style: TextStyle, color: Color? = nil) -> Self {
        let base: Text
        if let color = color {
            base = self.foregroundColor(color)
        } else {
            base = self
        }

        switch style {
        case .title1Bold:
            return base.font(.custom(.bold, size: .title1)).foregroundColor(.academyText)

        case .title1Medium:
            return base.font(.custom(.medium, size: .title1)).foregroundColor(.academyText)

        case .title2Bold:
            return base.font(.custom(.bold, size: .title2)).foregroundColor(.academyText)

        case .title2Medium:
            return base.font(.custom(.medium, size: .title2)).foregroundColor(.academyText)

        case .largeBold:
            return base.font(.custom(.bold, size: .large)).foregroundColor(.academyText)

        case .largeMedium:
            return base.font(.custom(.medium, size: .large)).foregroundColor(.academyText)

        case .largeMediumSecondary:
            return base.font(.custom(.medium, size: .title1)).foregroundColor(.academyText)

        case .regularBold:
            return base.font(.custom(.bold, size: .regular)).foregroundColor(.academyText)

        case .regularMedium:
            return base.font(.custom(.medium, size: .regular)).foregroundColor(.academyText)

        case .regularMediumPrimary:
            return base.font(.custom(.medium, size: .regular)).foregroundColor(.academyPrimary)

        case .regularMediumSecondary:
            return base.font(.custom(.medium, size: .regular)).foregroundColor(.academySecondaryText)

        case .regularMediumPositive:
            return base.font(.custom(.medium, size: .regular)).foregroundColor(.academyPositive)

        case .regularMediumNegative:
            return base.font(.custom(.medium, size: .regular)).foregroundColor(.academyNegative)

        case .smallBold:
            return base.font(.custom(.bold, size: .small)).foregroundColor(.academyText)

        case .smallMedium:
            return base.font(.custom(.medium, size: .small)).foregroundColor(.academyText)

        case .smallMediumPrimary:
            return base.font(.custom(.medium, size: .small)).foregroundColor(.academyPrimary)

        case .smallMediumSecondary:
            return base.font(.custom(.medium, size: .small)).foregroundColor(.academySecondaryText)

        case .smallMediumPositive:
            return base.font(.custom(.medium, size: .small)).foregroundColor(.academyPositive)

        case .smallMediumNegative:
            return base.font(.custom(.medium, size: .small)).foregroundColor(.academyNegative)

        case .tinyBold:
            return base.font(.custom(.bold, size: .tiny)).foregroundColor(.academyText)

        case .tinyMediumSecondary:
            return base.font(.custom(.medium, size: .tiny)).foregroundColor(.academySecondaryText)
        }
   }
}
