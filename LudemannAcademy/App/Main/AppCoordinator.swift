import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var loginCoordinator: LoginCoordinator!
    @Published var homeCoordinator: HomeCoordinator!
    @Published var isSignedIn: Bool = false
    
    init() {
        self.loginCoordinator = LoginCoordinator(parent: self)
        self.homeCoordinator = HomeCoordinator(parent: self)
    }
    
    func signIn() {
        isSignedIn = true
    }
    
    func signOut() {
        isSignedIn = false
    }
}
