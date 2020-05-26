//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Lucas Claro on 21/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

// Esse é o arquivo do Model 

struct MemoryGame<CardContent> {
    //O tipo genérico ^^ deve ser definido por quem chamar, igual um vetor
    
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("carta escolhida: \(card)")
        let cardIndex: Int = self.index(of: card)
        self.cards[cardIndex].isFaceUp = !self.cards[cardIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: não encontrei!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //Tipo genérico (don't care type)
    }
}
