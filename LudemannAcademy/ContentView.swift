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
            SuperTextField(
                placeholder: Text("Placeholder Text")
                    .font(.SharpSansBold(size: 24)).foregroundColor(.white),
                text: $username
            )
            .padding(.bottom, 4)
            SuperTextField(
                placeholder: Text("Placeholder Text").font(.SharpSansMedium(size: 24)).foregroundColor(.black),
                text: $username
            )

            Button(action: {
                print("Button action")
            }) {
                Text("Place Order")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(28)
                    .padding(.horizontal, 42)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SuperTextField: View {

    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                .padding(.horizontal, 16)
                .padding(.vertical, 24)
                .background(Color.red)
                .cornerRadius(16)

            if text.isEmpty {
                placeholder
                    .padding(.leading, 16)
            }
        }
    }

}
