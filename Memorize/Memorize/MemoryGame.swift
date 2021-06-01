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
    //calling this function is going to change the cards array
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("\(cards)")
    }
    
    func index(of card: Card) -> Int {
        
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0 //bogus!
    }
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCard * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        
        var content: CardContent
        //necesary stuff to behave like a Identifiable
        var id: Int
    }
}
