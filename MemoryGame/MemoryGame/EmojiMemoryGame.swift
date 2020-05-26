//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Lucas Claro on 21/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

//Esse é o arquivo do ViewModel

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // ^^ chama o objectWillChange.send() sempre que essa var mudar
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🎃", "👻", "🕷", "🌙", "🦴"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
