import SwiftUI

class LoginCoordinator: ObservableObject {
    private unowned let parent: AppCoordinator
    
    @Published var viewModel: LoginViewModel!
    
    init(parent: AppCoordinator) {
        self.parent = parent
        self.viewModel = .init(
            coordinator: self
        )
    }
    
    func signIn() {
        parent.signIn()
    }
}
