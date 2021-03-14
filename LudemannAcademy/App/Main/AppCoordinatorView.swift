import SwiftUI
import AcademyUI

struct AppCoordinatorView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        ZStack {
            if coordinator.appState == .app {
                HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            } else if coordinator.appState == .signIn {
                LoginCoordinatorView(coordinator: coordinator.loginCoordinator)
                    .transition(.move(edge: .bottom))
                    .zIndex(2)
            }
        }.animation(.easeInOut(duration: 0.5), value: coordinator.appState)
    }
}

struct AppCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        AppCoordinatorView(coordinator: AppCoordinator())
            .preferredColorScheme(.dark)
    }
}
