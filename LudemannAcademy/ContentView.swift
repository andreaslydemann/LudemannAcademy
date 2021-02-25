import SwiftUI
import AcademyUI
import UIKit

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    LoginView()
                }
                .frame(width: geometry.size.width)
                .frame(minHeight: geometry.size.height)
            }
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
