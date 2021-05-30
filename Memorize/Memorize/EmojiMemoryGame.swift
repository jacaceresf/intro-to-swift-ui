//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-30.
//


//it's part of the UI so we have to import this module, not part of the view.
import SwiftUI


//this is our ViewModel
class EmojiMemoryGame {
    
    //global but inside the namespace
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🚑", "🏎", "🚓", "🛻", "🚂", "🚠", "🛬", "✈️", "🛩", "🛳", "🛴", "🦼", "🚲","🚄","🚡","🚖","🚍","🚔","🏍"]

    static func createMemomyGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    //we can refer to the function
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCard: 4, createCardContent: makeCardContent)
    
    //also we can just drop the function inside the call
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemomyGame()
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
