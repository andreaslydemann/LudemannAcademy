import SwiftUI
import AcademyUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            LoginView()
            Spacer()
        }
        .background(Color.academyBackground)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
