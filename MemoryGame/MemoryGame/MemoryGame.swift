//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Lucas Claro on 21/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

// Esse é o arquivo do Model 

struct MemoryGame<CardContent> where CardContent: Equatable{
    //O tipo genérico ^^ deve ser definido por quem chamar, igual um vetor
    //                                      ^^ exige que o tipo genérico seja equatable para comparar os conteúdos
    
    var cards: Array<Card>
    var theme: ThemesModel.theme
    var points: Int = 0
    
    var indexOfOneAndOnlyFacedUpCard: Int? {
        get {
            let faceUpCardIndeces = cards.indices.filter { index in cards[index].isFaceUp}
            if faceUpCardIndeces.count == 1 {
                return faceUpCardIndeces.first
            }
            else {
                return nil
            }
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    //MARK: Choose function
    
    mutating func choose(card: Card){
        print("carta escolhida: \(card)")
        if let choosenIndex: Int = self.cards.index(of: card), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFacedUpCard{
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    points += 2
                }
                else{
                    if !cards[choosenIndex].wasFlipped{
                        cards[choosenIndex].wasFlipped = true
                    }
                    else{
                        points -= 1
                    }
                    
                    if !cards[potentialMatchIndex].wasFlipped{
                        cards[potentialMatchIndex].wasFlipped = true
                    }
                    else{
                        points -= 1
                    }
                }

                self.cards[choosenIndex].isFaceUp = !self.cards[choosenIndex].isFaceUp
            }
            else {
                indexOfOneAndOnlyFacedUpCard = choosenIndex
            }
        }
    }
    
    //MARK: Init
    
    init(numberOfPairsOfCards: Int, theme: ThemesModel.theme, cardContentFactory: (Int) -> CardContent) {
        self.theme = theme
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    //MARK: Card Struct
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var wasFlipped: Bool = false
        var content: CardContent //Tipo genérico (don't care type)
    }
}
