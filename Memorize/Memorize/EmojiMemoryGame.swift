//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-30.
//


//it's part of the UI so we have to import this module, not part of the view.
import SwiftUI


//this is our ViewModel
//are the kind of object that tells the world that something has changed.
class EmojiMemoryGame: ObservableObject {
    
    //global but inside the namespace
    static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🚑", "🏎", "🚓", "🛻", "🚂", "🚠", "🛬", "✈️", "🛩", "🛳", "🛴", "🦼", "🚲","🚄","🚡","🚖","🚍","🚔","🏍"]

    static func createMemomyGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 3) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    //we can refer to the function
    //private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCard: 4, createCardContent: makeCardContent)
    
    // also we can just drop the function inside the call
    // anytime this change, it will send the change to the UI
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemomyGame()
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
