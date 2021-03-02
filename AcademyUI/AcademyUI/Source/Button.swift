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

public struct ButtonDimensions {
    let width: CGFloat?
    let height: CGFloat?
    
    public init(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width
        self.height = height
    }
}

extension ButtonDimensions {
    func getSuggestedDimensions(for size: ButtonSize, padding: EdgeInsets) -> (width: CGFloat, height: CGFloat) {
        let width: CGFloat
        let height: CGFloat
        
        switch size {
        case .large:
            width = self.width ?? .suggestedLargeButtonWidth
            height = self.height ?? .suggestedLargeButtonHeight
        case .medium:
            width = self.width ?? .suggestedMediumButtonWidth
            height = self.height ?? .suggestedMediumButtonHeight
        case .small:
            width = self.width ?? .suggestedSmallButtonWidth
            height = self.height ?? .suggestedSmallButtonHeight
        }
        
        return (width: width, height: height)
    }
}

struct ButtonStyleModifier: ViewModifier {
    let style: ButtonType
    let dimensions: ButtonDimensions
    let padding: EdgeInsets?
    
    func body(content: Content) -> some View {
        let padding = self.padding ??
            .init(top: .zero, leading: 16, bottom: .zero, trailing: 16)
        let buttonStyle: AcademyButtonStyle
        
        switch style {
        case .large:
            buttonStyle = AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .largeSecondary:
            buttonStyle = AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .largeOutlined:
            buttonStyle = AcademyButtonStyle(size: .large, scheme: ButtonColorScheme(content: .academyText, background: .clear, border: .academyText), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .medium:
            buttonStyle = AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .mediumSecondary:
            buttonStyle = AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .mediumOutlined:
            buttonStyle = AcademyButtonStyle(size: .medium, scheme: ButtonColorScheme(content: .academyText, background: .clear, border: .academyText), textStyle: .regularBold, dimensions: dimensions, padding: padding)
        case .small:
            buttonStyle = AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academyButtonContent, background: .academyButtonBackground), textStyle: .smallBold, dimensions: dimensions, padding: padding)
        case .smallSecondary:
            buttonStyle = AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academyButtonSecondaryContent, background: .academyButtonSecondaryBackground), textStyle: .smallBold, dimensions: dimensions, padding: padding)
        case .smallLink:
            buttonStyle = AcademyButtonStyle(size: .small, scheme: ButtonColorScheme(content: .academySecondaryText, background: .clear), textStyle: .smallMedium, dimensions: dimensions, alignment: .leading, padding: self.padding ?? .init())
        }
        
        return AnyView(content.buttonStyle(buttonStyle))
    }
}

extension View {
    public func buttonStyle(_ type: ButtonType, _ dimensions: ButtonDimensions = .init(), padding: EdgeInsets? = nil) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyleModifier(style: type, dimensions: dimensions, padding: padding))
    }
}

struct AcademyButtonStyle: ButtonStyle {
    let size: ButtonSize
    let scheme: ButtonColorScheme
    let textStyle: TextStyle
    let dimensions: ButtonDimensions
    let alignment: Alignment
    let padding: EdgeInsets
    
    init(size: ButtonSize, scheme: ButtonColorScheme, textStyle: TextStyle, dimensions: ButtonDimensions, alignment: Alignment = .center, padding: EdgeInsets = .init()) {
        self.size = size
        self.scheme = scheme
        self.textStyle = textStyle
        self.dimensions = dimensions
        self.alignment = alignment
        self.padding = padding
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        AcademyButton(size: size, scheme: scheme, textStyle: textStyle, dimensions: dimensions, alignment: alignment, padding: padding, configuration: configuration)
    }
    
    struct AcademyButton: View {
        let size: ButtonSize
        let scheme: ButtonColorScheme
        let textStyle: TextStyle
        let dimensions: ButtonDimensions
        let alignment: Alignment
        let padding: EdgeInsets
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        var body: some View {
            let colors = scheme.getCurrentColorSet(state: ButtonState.getState(isEnabled: isEnabled, isPressed: configuration.isPressed))
            let (width, height) = dimensions.getSuggestedDimensions(for: size, padding: padding)
            
            configuration.label
                .textStyle(textStyle, color: colors.contentColor)
                .frame(minWidth: width, minHeight: height, alignment: alignment)
                .padding(padding)
                .lineLimit(0)
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

#if DEBUG
struct Button_Previews : PreviewProvider {
    static var previews: some View {
        HStack(spacing: Spacing.medium.rawValue) {
            VStack {
                Text("Large")
                    .frame(width: 150)
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
                    .frame(width: 150)
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
                    .frame(width: 120)
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
