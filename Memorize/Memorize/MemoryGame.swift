//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-30.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    //the _ represents a blank external name for the argument
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCard * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
