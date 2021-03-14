import SwiftUI

class HomeCoordinator: ObservableObject {
    private unowned let parent: AppCoordinator
    
    @Published var viewModel: HomeViewModel!
    
    init(parent: AppCoordinator) {
        self.parent = parent
        self.viewModel = .init(
            coordinator: self
        )
    }
    
    func signOut() {
        parent.signOut()
    }
}
