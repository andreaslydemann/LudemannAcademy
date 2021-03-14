import SwiftUI

class HomeViewModel: ObservableObject {
    private unowned let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
    
    func signOut() {
        self.coordinator.signOut()
    }
}
