import SwiftUI
import AcademyUI

struct LoginScreen: View {
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    LoginView(showingAlert: $showingAlert)
                        .frame(width: geometry.size.width)
                        .frame(minHeight: geometry.size.height)
                }
            }

            if showingAlert {
                AlertView(showingAlert: $showingAlert)
            }
        }
        .background(Color.academyBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editing = false
    @Binding var showingAlert: Bool

    var body: some View {
        ZStack {
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
                        showingAlert.toggle()
                    }) {
                        Text("Forgot Password?")
                            .textStyle(.smallMediumSecondary)
                            .textCase(.uppercase)
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
    }
}

struct AcademyTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, Spacing.small.rawValue)
            .padding(.vertical, Spacing.medium.rawValue)
            .textStyle(.regularMediumSecondary)
            .background(Color.academySurface)
            .cornerRadius(16)
    }
}

struct AlertView: View {
    @Binding var showingAlert: Bool
    @State var scale: CGFloat = 0

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.7)
                .onTapGesture {
                    showingAlert.toggle()

                }

            GeometryReader { geometry in
                VStack {
                    Text("Forgot your password?")
                        .textStyle(.largeBold)
                        .padding(.bottom, Spacing.tiny.rawValue)

                    Text("No problem. Write me an email and I’ll help you out.")
                        .textStyle(.regularMediumSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.medium.rawValue)

                    Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Text("Got it!")
                            .textStyle(.regularBold, color: .academyText)
                            .frame(width: geometry.size.width * 0.5)
                            .padding(.vertical, 10)
                            .background(Color.academySurface)
                            .cornerRadius(28)
                    })
                }
                .padding(Spacing.medium.rawValue)
                .background(Color.academySecondaryBackground)
                .cornerRadius(25)
                .frame(width: geometry.size.width * 0.8,
                       height: geometry.size.height * 0.2)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 2)
            }
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.interactiveSpring()) {
                    scale = 1
                }
            }
        }
    }
}
