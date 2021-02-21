//
//  LudemannAcademyApp.swift
//  LudemannAcademy
//
//  Created by Andreas on 19/02/2021.
//

import SwiftUI
import AcademyUI

@main
struct LudemannAcademyApp: App {
    init() {
        FontLoader.loadFont()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
