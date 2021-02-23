//
//  ContentView.swift
//  LudemannAcademy
//
//  Created by Andreas on 19/02/2021.
//

import SwiftUI
import AcademyUI

struct ContentView: View {
    @State var username: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            SuperTextField(
                placeholder: AnyView(Text("E-mail").textStyle(.regularMediumSecondary).opacity(0.3)),
                text: $username
            )
            .padding(.bottom, Spacing.tiny.rawValue)
            SuperTextField(
                placeholder:
                    AnyView(Text("Password").textStyle(.regularMediumSecondary).opacity(0.3)),
                text: $username
            )
            .padding(.bottom, Spacing.xSmall.rawValue)

            Text("Forgot Password?")
                .textStyle(.smallMediumSecondary)
                .textCase(.uppercase)
                .padding(.leading, Spacing.small.rawValue)
                .padding(.bottom, Spacing.xxLarge.rawValue)

            HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    print("Button action")
                }) {
                    Text("Place Order")
                        .textStyle(.regularBold, color: .academyButtonContent)
                        .frame(maxWidth: .academyButtonWidth)
                        .padding(.vertical, 20)
                        .background(Color.academyButtonBackground)
                        .cornerRadius(28)
                }
                Spacer()
            }
            
            Spacer()
        }
        .padding()
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

struct SuperTextField: View {
    var placeholder: AnyView
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .padding(.horizontal, Spacing.small.rawValue)
                .padding(.vertical, Spacing.medium.rawValue)
                .background(Color.academySurface)
                .cornerRadius(16)

            if text.isEmpty {
                placeholder
                    .padding(.leading, Spacing.small.rawValue)
            }
        }
    }

}
