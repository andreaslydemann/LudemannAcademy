import SwiftUI
import AcademyUI

struct LoginScreen: View {
    @State private var isPresentingAlert = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                LoginView(isPresentingAlert: $isPresentingAlert)
                    .frame(width: geometry.size.width)
                    .frame(height: geometry.size.height)
            }
            .alert(isPresenting: $isPresentingAlert,
                   title: "Forgot your password?",
                   message: "No problem. Write me an email and I'll help you out.",
                   buttons: [.init(title: "Got it!", type: .secondary)])
            
        }.background(
            LinearGradient(gradient: Gradient(colors: [Color.academySecondary.opacity(0.15), .clear]), startPoint: .top, endPoint: .bottom)
                .background(Color.academyBackground).edgesIgnoringSafeArea(.all))
    }
}

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var editing = false
    @Binding var isPresentingAlert: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                HStack(spacing: Spacing.small.rawValue) {
                    Image(named: "logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .shadow(color: .init(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                    
                    VStack(alignment: .leading) {
                        Text("Lüdemann")
                            .textStyle(.title2Bold)
                            .textCase(.uppercase)
                        Text("Academy")
                            .textStyle(.title2Bold)
                            .textCase(.uppercase)
                    }
                }
                .padding(.bottom, Spacing.small.rawValue)
                
                Text("Keep up with modern iOS practices.")
                    .textStyle(.regularMedium)
                
                Text("Become an in-demand iOS developer..")
                    .textStyle(.regularMedium)
                
                Spacer()
                    .frame(maxHeight: Spacing.xxLarge.rawValue)
                
                TextField("E-mail", text: self.$email)
                    .textFieldStyle(.academyTextField)
                    .autocapitalization(.none)
                    .padding(.bottom, Spacing.xSmall.rawValue)
                
                SecureField("Password", text: self.$password)
                    .textFieldStyle(.academyTextField)
                    .autocapitalization(.none)
                
                HStack {
                    Button("Forgot Password?", action: {
                        isPresentingAlert.toggle()
                    })
                    .buttonStyle(.smallLink)
                    .textCase(.uppercase)
                    .padding(.leading, Spacing.small.rawValue)
                    .padding(.bottom, Spacing.xxLarge.rawValue)
                    
                    Spacer()
                }
                
                Spacer(minLength: 100)
            }
            
            VStack {
                Button("Log in", action: {
                    print("Button action")
                })
                .buttonStyle(.large)
                .padding(.bottom, Spacing.small.rawValue)
                
                Button {
                    print("Button pressed")
                } label: {
                    HStack {
                        Text("Not signed up?")
                            .textStyle(.regularMedium)
                        Text("Get started")
                            .textStyle(.regularBold, color: .academyPrimary)
                    }
                }
                .buttonStyle(.smallLink)
            }
        }
        .padding(.bottom, Spacing.tiny.rawValue)
        .padding(.horizontal)
        .onTapDismissKeyboard()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .preferredColorScheme(.dark)
    }
}
