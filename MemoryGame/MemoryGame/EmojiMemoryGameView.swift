//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Lucas Claro on 20/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

enum ColorsEnum{
    case Orange
    case Green
    case Yellow
    case Red
    case Pink
    case Blue
    
    func colorCode() -> Color{
        switch self {
        case .Orange:
            return Color.orange
        case .Green:
            return Color.green
        case .Yellow:
            return Color.yellow
        case .Red:
            return Color.red
        case .Pink:
            return Color.pink
        case.Blue:
            return Color.blue
        }
    }
}

struct EmojiMemoryGameView: View {
    @ObservedObject  var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.themeName)
                Spacer()
                Text(String(viewModel.points))
                Spacer()
                Button("Novo Jogo", action: viewModel.NewGame)
            }
                .padding()
            Grid(viewModel.cards) { card in
                
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                    .padding()
            }
                .padding()
                .foregroundColor(viewModel.color.colorCode())
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: BorderWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched{
                    RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
                }
            }
            
        }
        //.aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
        .font(Font.system(size:  fontSize(for: size)))
        
    }
    
    //MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let BorderWidth: CGFloat = 3
    let fontScale: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * fontScale
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
