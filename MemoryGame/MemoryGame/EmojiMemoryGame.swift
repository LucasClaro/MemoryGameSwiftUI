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
    static private var themesModel: ThemesModel = ThemesModel()
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let theme: ThemesModel.theme = themesModel.themes.randomElement()!
        return MemoryGame<String>(numberOfPairsOfCards: theme.pairs ?? Int.random(in: 2...theme.Emojis.count), theme: theme) { pairIndex in
            return theme.Emojis[pairIndex]
        }
        
    }
    
    // MARK: - Access to the GameModel
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    var color: ColorsEnum{
        model.theme.color
    }
    
    var themeName: String{
        model.theme.name
    }
    
    var points: Int{
        model.points
    }
    
    // MARK: - Intent(s)
    
    func NewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
