import SwiftUI

public struct AlertButton {
    public enum ActionType {
        case primary, secondary
    }
    
    let title: String
    let type: ActionType
    let action: (() -> Void)?

    public init(title: String, type: ActionType, action: (() -> Void)? = nil) {
        self.title = title
        self.type = type
        self.action = action
    }
}

public struct AlertView: View {
    @State var scale: CGFloat = 0.4
    @Binding var isPresenting: Bool
    let title: String
    let message: String?
    let buttons: [AlertButton]
    
    public init(isPresenting: Binding<Bool>, title: String, message: String?, buttons: [AlertButton]) {
        self._isPresenting = isPresenting
        self.title = title
        self.message = message
        self.buttons = buttons
    }
    
    private func alertButtons(width: CGFloat) -> [Any] {
        var alertButtons: [Any] = []

        for button in buttons {
            let action = {
                button.action?()
                isPresenting.toggle()
            }
            
            switch button.type {
            case .primary:
                let button =
                    Button(button.title, action: action)
                    .buttonStyle(.small, .init(width: width * 0.5))
                
                alertButtons.append(button)
            case .secondary:
                let button =
                    Button(button.title, action: action)
                    .buttonStyle(.smallSecondary, .init(width: width * 0.5))
                
                alertButtons.append(button)
            }
        }
        
        return alertButtons
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.7)
                .onTapGesture {
                    isPresenting.toggle()
                }
            
            GeometryReader { geometry in
                VStack {
                    Text(title)
                        .textStyle(.largeBold)
                        .padding(.bottom, Spacing.tiny.rawValue)
                    
                    if let message = message {
                        Text(message)
                            .textStyle(.regularMediumSecondary)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, Spacing.medium.rawValue)
                    }
                    
                    ForEach(0 ..< alertButtons(width: geometry.size.width).count) { index in
                        AnyView(_fromValue: alertButtons(width: geometry.size.width)[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal, Spacing.medium.rawValue)
                .padding(.vertical, Spacing.medium.rawValue)
                .background(Color.academySecondaryBackground)
                .cornerRadius(25)
                .frame(width: geometry.size.width * 0.8)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 2)
            }
            .scaleEffect(scale)
            .animation(.interactiveSpring(response: 0.25), value: scale)
            .onAppear {
                scale = 1
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

extension View {
    public func alert(
            isPresenting: Binding<Bool>,
            title: String,
            message: String?,
        buttons: [AlertButton]
        ) -> some View {
            return self.modifier(
                AlertModifier(
                    isPresenting: isPresenting,
                    title: title,
                    message: message,
                    buttons: buttons
                )
            )
        }
}

struct AlertModifier: ViewModifier {
    @Binding var isPresenting: Bool
    let title: String
    let message: String?
    let buttons: [AlertButton]

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresenting {
                AlertView(
                    isPresenting: $isPresenting,
                    title: title,
                    message: message,
                    buttons: buttons
                )
            }
        }
    }
}
