//
//  Themes.swift
//  MemoryGame
//
//  Created by Lucas Claro on 30/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

struct ThemesModel {
    var themes = [theme]()
    
    init() {
        themes.append(theme(name: "Halloween", Emojis: ["🎃", "👻", "🕷", "🌙", "🦴"], pairs: nil, color: ColorsEnum.Orange))
        themes.append(theme(name: "Animals", Emojis: ["🐶", "🐱", "🦊", "🐰", "🐸", "🐔", "🦆"], pairs: 7, color: ColorsEnum.Green))
        themes.append(theme(name: "Fruits", Emojis: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍍", "🍒", "🍑", "🥝", "🥑"], pairs: 11, color: ColorsEnum.Yellow))
        themes.append(theme(name: "Sports", Emojis: ["⚽️", "🏀", "🏈", "⚾️", "🎾", "🏐", "🏓"], pairs: 7, color: ColorsEnum.Red))
        themes.append(theme(name: "Flags", Emojis: ["🏳️", "🏁", "🏴‍☠️", "🚩", "🏳️‍🌈", "🇺🇳", "🇳🇿"], pairs: 7, color: ColorsEnum.Pink))
        themes.append(theme(name: "Sea Animals", Emojis: ["🐙", "🦑", "🦞", "🦐", "🦀", "🐡", "🐬", "🐋"], pairs: 8, color: ColorsEnum.Blue))
    }
    
    struct theme : Identifiable{
        var id = UUID()
        var name: String
        var Emojis: Array<String>
        var pairs: Int?
        var color: ColorsEnum
        
        init(name: String, Emojis: Array<String>, pairs: Int?, color: ColorsEnum) {
            self.name = name
            self.Emojis = Emojis
            self.pairs = pairs
            self.color = color
        }
    }
}
