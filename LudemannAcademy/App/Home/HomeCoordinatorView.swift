import SwiftUI
import AcademyUI

struct HomeCoordinatorView: View {
    @ObservedObject var coordinator: HomeCoordinator

    var body: some View {
        HomeScreen(viewModel: coordinator.viewModel)
    }
}
