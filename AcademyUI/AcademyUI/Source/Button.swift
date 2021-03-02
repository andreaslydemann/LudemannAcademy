import SwiftUI

public enum ButtonType: CaseIterable {
    // large
    case large
    case largeSecondary
    case largeOutlined
    
    // medium
    case medium
    case mediumSecondary
    case mediumOutlined
    
    // small
    case small
    case smallSecondary
    case smallLink
}

enum ButtonSize {
    case large
    case medium
    case small
}

enum ButtonState {
    case normal
    case disabled
    case highlighted
    
    static func getState(isEnabled: Bool, isPressed: Bool) -> Self {
        if isEnabled {
            if isPressed {
                return .highlighted
            } else {
                return .normal
            }
        } else {
            return .disabled
        }
    }
}

struct ButtonColorScheme {
    struct StateColorSet {
        let contentColor: Color
        let backgroundColor: Color
        let borderColor: Color?
    }
    
    let normalColors: StateColorSet
    let highlightedColors: StateColorSet
    let disabledColors: StateColorSet
    
    init(content: Color, background: Color, border: Color? = nil) {
        let defaultHighlightedOpacity: Double = 0.75
        let defaultDisabledOpacity: Double = 0.25
        
        self.normalColors = StateColorSet(contentColor: content, backgroundColor: background, borderColor: border)
        self.highlightedColors = StateColorSet(
            contentColor: content.opacity(defaultHighlightedOpacity),
            backgroundColor: background.opacity(defaultHighlightedOpacity),
            borderColor: border?.opacity(defaultHighlightedOpacity))
        self.disabledColors = StateColorSet(
            contentColor: content.opacity(defaultDisabledOpacity),
            backgroundColor: background.opacity(defaultDisabledOpacity),
            borderColor: border?.opacity(defaultDisabledOpacity))
    }
    
    init(normalColors: StateColorSet, highlightedColors: StateColorSet, disabledColors: StateColorSet) {
        self.normalColors = normalColors
        self.highlightedColors = highlightedColors
        self.disabledColors = disabledColors
    }
}

extension ButtonColorScheme {
    func getCurrentColorSet(state: ButtonState) -> StateColorSet {
        switch state {
        case .normal:
            return normalColors
        case .highlighted:
            return highlightedColors
        case .disabled:
            return disabledColors
        }
    }
}

struct ButtonStyleModifier: ViewModifier {
    let style: ButtonType
    
    func body(content: Content) -> some View {
        switch style {
        case .large:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground))))
        case .largeSecondary:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground))))
        case .largeOutlined:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyText, background: .clear, border: .academyText))))
        case .medium:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground))))
        case .mediumSecondary:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground))))
        case .mediumOutlined:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyText, background: .clear, border: .academyText))))
        case .small:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground))))
        case .smallSecondary:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground))))
        case .smallLink:
            return AnyView(content.buttonStyle(AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academyText, background: .clear))))
        }
    }
}

extension View {
    public func buttonStyle(_ type: ButtonType) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyleModifier(style: type))
    }
}

struct AcademyButtonStyle: ButtonStyle {
    let size: ButtonSize
    let scheme: ButtonColorScheme
    
    func makeBody(configuration: Self.Configuration) -> some View {
        AcademyButton(size: size, scheme: scheme, configuration: configuration)
    }
    
    struct AcademyButton: View {
        let size: ButtonSize
        let scheme: ButtonColorScheme
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        var body: some View {
            let colors = scheme.getCurrentColorSet(state: ButtonState.getState(isEnabled: isEnabled, isPressed: configuration.isPressed))
            
            switch size {
            case .large:
                configuration.label
                    .textStyle(.regularBold, color: colors.contentColor)
                    .frame(minWidth: .suggestedLargeButtonWidth)
                    .padding(20)
                    .background(colors.backgroundColor)
                    .cornerRadius(28)
                    .ifLet(colors.borderColor) {
                        $0.overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke($1, lineWidth: 2)
                        )
                    }
                
            case .medium:
                configuration.label
                    .textStyle(.regularBold, color: colors.contentColor)
                    .frame(minWidth: .suggestedMediumButtonWidth)
                    .padding(14)
                    .background(colors.backgroundColor)
                    .cornerRadius(28)
                    .ifLet(colors.borderColor) {
                        $0.overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke($1, lineWidth: 2)
                        )
                    }
                
            case .small:
                configuration.label
                    .textStyle(.smallBold, color: colors.contentColor)
                    .frame(minWidth: .suggestedSmallButtonWidth)
                    .padding(10)
                    .background(colors.backgroundColor)
                    .cornerRadius(28)
                    .ifLet(colors.borderColor) {
                        $0.overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke($1, lineWidth: 2)
                        )
                    }
            }
        }
    }
}

#if DEBUG
struct Button_Previews : PreviewProvider {
    static var previews: some View {
        HStack(spacing: Spacing.medium.rawValue) {
            VStack {
                Text("Large")
                    .textStyle(.title1Bold)
                    .padding(.bottom, Spacing.medium.rawValue)
                
                Button("large", action: {})
                    .buttonStyle(.large)
                Button("large", action: {})
                    .disabled(true)
                    .buttonStyle(.large)
                Button("largeSecondary", action: {})
                    .buttonStyle(.largeSecondary)
                Button("largeSecondary", action: {})
                    .disabled(true)
                    .buttonStyle(.largeSecondary)
                Button("largeOutlined", action: {})
                    .buttonStyle(.largeOutlined)
                Button("largeOutlined", action: {})
                    .disabled(true)
                    .buttonStyle(.largeOutlined)
            }
            
            VStack {
                Text("Medium")
                    .textStyle(.title1Bold)
                    .padding(.bottom, Spacing.medium.rawValue)
                
                Button("medium", action: {})
                    .buttonStyle(.medium)
                Button("medium", action: {})
                    .disabled(true)
                    .buttonStyle(.medium)
                Button("mediumSecondary", action: {})
                    .buttonStyle(.mediumSecondary)
                Button("mediumSecondary", action: {})
                    .disabled(true)
                    .buttonStyle(.mediumSecondary)
                Button("mediumOutlined", action: {})
                    .buttonStyle(.mediumOutlined)
                Button("mediumOutlined", action: {})
                    .disabled(true)
                    .buttonStyle(.mediumOutlined)
            }
            
            VStack {
                Text("Small")
                    .textStyle(.title1Bold)
                    .padding(.bottom, Spacing.medium.rawValue)
                
                Button("small", action: {})
                    .buttonStyle(.small)
                Button("small", action: {})
                    .disabled(true)
                    .buttonStyle(.small)
                Button("smallSecondary", action: {})
                    .buttonStyle(.smallSecondary)
                Button("smallSecondary", action: {})
                    .disabled(true)
                    .buttonStyle(.smallSecondary)
                Button("smallLink", action: {})
                    .buttonStyle(.smallLink)
                Button("smallLink", action: {})
                    .disabled(true)
                    .buttonStyle(.smallLink)
            }
        }
        .preferredColorScheme(.dark)
    }
}
#endif
