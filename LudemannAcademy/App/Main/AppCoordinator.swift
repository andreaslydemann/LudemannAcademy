import SwiftUI

enum AppState {
    case signIn, app
}

class AppCoordinator: ObservableObject {
    @Published var loginCoordinator: LoginCoordinator!
    @Published var homeCoordinator: HomeCoordinator!
    @Published var appState: AppState = .signIn
    
    init() {
        self.loginCoordinator = LoginCoordinator(parent: self)
        self.homeCoordinator = HomeCoordinator(parent: self)
    }
    
    func signIn() {
        appState = .app
    }
    
    func signOut() {
        appState = .signIn
    }
}
