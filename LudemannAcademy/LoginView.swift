import SwiftUI
import AcademyUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Image(named: "logo")
                .resizable()
                .frame(width: 80, height: 80)
                .shadow(color: .init(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                .padding(.bottom, Spacing.small.rawValue)

            Text("Lüdemann Academy")
                .textStyle(.largeBold)
                .textCase(.uppercase)
                .padding(.bottom, Spacing.xxxLarge.rawValue)

            SuperTextField(
                placeholder: AnyView(Text("E-mail").textStyle(.regularMediumSecondary).opacity(0.3)),
                text: $username
            )
            .padding(.bottom, Spacing.tiny.rawValue)
            SuperTextField(
                placeholder:
                    AnyView(Text("Password").textStyle(.regularMediumSecondary).opacity(0.3)),
                text: $password
            )
            .padding(.bottom, Spacing.xSmall.rawValue)

            HStack {
                Button(action: {
                    showingAlert = true
                }) {
                Text("Forgot Password?")
                    .textStyle(.smallMediumSecondary)
                    .textCase(.uppercase)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Forgot your password?"), message: Text("No problem. Write me an email and I'll help you out."), dismissButton: .default(Text("Got it!")))
                }
                .padding(.leading, Spacing.small.rawValue)
                .padding(.bottom, Spacing.xxxLarge.rawValue)

                Spacer()
            }

            Button(action: {
                print("Button action")
            }) {
                Text("Log In")
                    .textStyle(.regularBold, color: .academyButtonContent)
                    .frame(maxWidth: .academyButtonWidth)
                    .padding(.vertical, 20)
                    .background(Color.academyButtonBackground)
                    .cornerRadius(28)
            }
        }
        .padding(.horizontal)
        .onTapDismissKeyboard()
        .keyboardAdaptive()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

struct SuperTextField: View {
    var placeholder: AnyView
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .padding(.horizontal, Spacing.small.rawValue)
                .padding(.vertical, Spacing.medium.rawValue)
                .background(Color.academySurface)
                .cornerRadius(16)

            if text.isEmpty {
                placeholder
                    .padding(.leading, Spacing.small.rawValue)
            }
        }
    }
}
