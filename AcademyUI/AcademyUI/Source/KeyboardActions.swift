import SwiftUI
import Combine

// MARK: - Adapt To Keyboard

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .animation(.spring())
            .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

extension View {
    public func adaptToKeyboard() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}

// MARK: - Dismiss Keyboard

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

struct DismissKeyboardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
    }
}

extension View {
    public func onTapDismissKeyboard() -> some View {
        ModifiedContent(content: self, modifier: DismissKeyboardModifier())
    }
}
