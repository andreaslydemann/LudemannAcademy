import SwiftUI

class LoginViewModel: ObservableObject {
    private unowned let coordinator: LoginCoordinator
    
    @Published var alertTitle: String
    @Published var alertMessage: String

    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
        self.alertTitle = "Forgot your password?"
        self.alertMessage = "No problem. Write me an email and I'll help you out."
    }
    
    func signIn() {
        self.coordinator.signIn()
    }
}
