import SwiftUI
import AcademyUI

struct HomeScreen: View {
    @ObservedObject var viewModel: HomeViewModel
    @State private var isPresentingAlert = false
    
    var body: some View {
        VStack {
            Button("Log out", action: {
                self.viewModel.signOut()
            })
            .buttonStyle(.large)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: HomeViewModel(coordinator: HomeCoordinator(parent: AppCoordinator())))
            .preferredColorScheme(.dark)
    }
}
