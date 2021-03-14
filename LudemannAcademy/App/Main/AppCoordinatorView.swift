import SwiftUI
import AcademyUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        if coordinator.isSignedIn {
            HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
        } else {
            LoginCoordinatorView(coordinator: coordinator.loginCoordinator)
        }
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView(coordinator: AppCoordinator())
            .preferredColorScheme(.dark)
    }
}
