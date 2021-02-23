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
        VStack(alignment: .center) {
            Spacer()

            Image(named: "logo")
                .resizable()
                .frame(width: 80, height: 80)
                .shadow(color: .init(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                .padding(.bottom, Spacing.small.rawValue)

            Text("Lüdemann Academy")
                .textStyle(.largeBold)
                .textCase(.uppercase)
                .padding(.bottom, Spacing.xxxxLarge.rawValue)

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

            HStack {
                Text("Forgot Password?")
                    .textStyle(.smallMediumSecondary)
                    .textCase(.uppercase)
                    .padding(.leading, Spacing.small.rawValue)
                    .padding(.bottom, Spacing.xxLarge.rawValue)

                Spacer()
            }

            Button(action: {
                print("Button action")
            }) {
                Text("Log In")
                    .textStyle(.regularBold, color: .academyButtonContent)
                    .frame(maxWidth: .academyButtonWidth)
                    .padding(.vertical, 20)
                    .background(Color.academyButtonBackground)
                    .cornerRadius(28)
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
