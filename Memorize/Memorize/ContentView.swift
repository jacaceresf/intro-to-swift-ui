//
//  ContentView.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-21.
//

import SwiftUI

struct ContentView: View {
    
    // it means that it going to rebuild the entire view when a change occurs
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //a function with no name and it doesn't take parameters
    var body: some View {
        ScrollView {
            //horizontal stack
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                //foreach with range
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            //asking view model to express the intent of user
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

//views are inmmutable, so the OS render many views when to show a change
struct CardView: View {
    
    //it is just a read only struct
    let card: MemoryGame<String>.Card
    
    var body : some View {
        ZStack {
            //define local variable
            // let when we're defining a variable that will be a constat
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
    }
}
