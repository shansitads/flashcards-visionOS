//
//  FlashcardsApp.swift
//  Flashcards
//
//  Created by shansita-dev on 7/18/24.
//

import SwiftUI

@main
struct FlashcardsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
