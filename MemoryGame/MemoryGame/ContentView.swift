//
//  ContentView.swift
//  MemoryGame
//
//  Created by Lucas Claro on 20/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
            
        }
            .padding()
            .font(viewModel.cards.count < 10 ? Font.largeTitle : Font.body)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color.orange)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
                    .foregroundColor(Color.orange)
            }
        }
        .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
