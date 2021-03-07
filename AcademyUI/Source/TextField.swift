import SwiftUI

public enum TextFieldType: CaseIterable {
    case academyTextField
}

public struct AcademyTextFieldStyle: TextFieldStyle {
    public init() {}
    
    public func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.horizontal, Spacing.small.rawValue)
            .padding(.vertical, Spacing.medium.rawValue)
            .textStyle(.regularMediumSecondary)
            .background(Color.academySurface)
            .cornerRadius(16)
    }
}

extension View {
    public func textFieldStyle(_ type: TextFieldType) -> some View {
        ModifiedContent(content: self, modifier: TextFieldStyleModifier(style: type))
    }
}

struct TextFieldStyleModifier: ViewModifier {
    let style: TextFieldType
    
    func body(content: Content) -> some View {
        switch style {
        case .academyTextField:
            return AnyView(content.textFieldStyle(AcademyTextFieldStyle()))
        }
    }
}
