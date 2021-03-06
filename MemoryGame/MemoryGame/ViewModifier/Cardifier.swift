//
//  Cardifier.swift
//  MemoryGame
//
//  Created by Lucas Claro on 01/06/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct Cardify : ViewModifier {
    var isFaceUp : Bool
    
    func body(content: Content) -> some View {
        
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: BorderWidth)
                content
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius)
                .fill()
            }
        }
        
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let BorderWidth: CGFloat = 3
}

extension View {
    func cardify (isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
