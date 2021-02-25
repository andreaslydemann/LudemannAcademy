import SwiftUI
import AcademyUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var editing = false

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

            TextField("E-mail", text: self.$email)
                .textFieldStyle(AcademyTextFieldStyle())
                .padding(.bottom, Spacing.xSmall.rawValue)

            TextField("Password", text: self.$password)
                .textFieldStyle(AcademyTextFieldStyle())
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
        .adaptToKeyboard()
        .onTapDismissKeyboard()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

struct AcademyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(.horizontal, Spacing.small.rawValue)
        .padding(.vertical, Spacing.medium.rawValue)
        .background(Color.academySurface)
        .textStyle(.regularMediumSecondary)
        .cornerRadius(16)
    }
}
