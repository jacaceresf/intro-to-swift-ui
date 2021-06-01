//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
