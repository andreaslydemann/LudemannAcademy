import SwiftUI

public struct AlertView: View {
    let title: String
    let message: String
    let buttonText: String
    @Binding var showingAlert: Bool
    @State var scale: CGFloat = 0.1
    
    public init(title: String, message: String, buttonText: String, showingAlert: Binding<Bool>) {
        self.title = title
        self.message = message
        self.buttonText = buttonText
        self._showingAlert = showingAlert
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.7)
                .onTapGesture {
                    showingAlert.toggle()
                }
            
            GeometryReader { geometry in
                VStack {
                    Text(title)
                        .textStyle(.largeBold)
                        .padding(.bottom, Spacing.tiny.rawValue)
                    
                    Text(message)
                        .textStyle(.regularMediumSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Spacing.medium.rawValue)
                    
                    Button(buttonText, action: {
                        showingAlert.toggle()
                    })
                    .buttonStyle(.smallSecondary, .init(width: geometry.size.width * 0.5))
                }
                .padding(Spacing.medium.rawValue)
                .background(Color.academySecondaryBackground)
                .cornerRadius(25)
                .frame(width: geometry.size.width * 0.8,
                       height: geometry.size.height * 0.2)
                .position(x: geometry.size.width / 2,
                          y: geometry.size.height / 2)
            }
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.interactiveSpring()) {
                    scale = 1
                }
            }
        }
    }
}
