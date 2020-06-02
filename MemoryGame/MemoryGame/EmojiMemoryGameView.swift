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
    @ObservedObject var viewModel: EmojiMemoryGame
    
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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle : Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
                //.modifier(Cardify(isFaceUp: card.isFaceUp))
                .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    //MARK: - Drawing Constants
    
    private let fontScale: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat{
        min(size.width, size.height) * fontScale
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
