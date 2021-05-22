//
//  ContentView.swift
//  Memorize
//
//  Created by Jorge Cáceres Flores on 2021-05-21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🚑", "🏎", "🚓", "🛻", "🚂", "🚠", "🛬", "✈️", "🛩", "🛳", "🛴", "🦼", "🚲","🚄","🚡","🚖","🚍","🚔","🏍"]
    
    @State var emojiCount: Int = 4
    
    //a function with no name and it doesn't take parameters
    var body: some View {
        VStack{
            ScrollView {
                //horizontal stack
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    //foreach with range
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer(minLength: 20)
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.rectangle.fill")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.rectangle.fill")
        }
    }
    
}

//views are inmmutable, so the OS render many views when to show a change
struct CardView: View {
    
    var content: String
    // variables always have to have a value
    @State var isFaceUp: Bool = false
    
    var body : some View {
        ZStack {
            //define local variable
            // let when we're defining a variable that will be a constat
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
    }
}
