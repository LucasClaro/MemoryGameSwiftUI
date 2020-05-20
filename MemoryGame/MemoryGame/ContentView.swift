//
//  ContentView.swift
//  MemoryGame
//
//  Created by Lucas Claro on 20/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: index % 2 == 0)
            }
        }
            .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View{
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color.orange)
                Text("🎃")
                    .font(Font.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill()
                    .foregroundColor(Color.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
