import SwiftUI
import AcademyUI

struct LoginCoordinatorView: View {
    @ObservedObject var coordinator: LoginCoordinator

    var body: some View {
        LoginScreen(viewModel: coordinator.viewModel)
        
    }
}
