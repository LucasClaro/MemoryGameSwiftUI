//
//  Grid.swift
//  MemoryGame
//
//  Created by Lucas Claro on 28/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var itens: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ itens: [Item], viewForItem: @escaping (Item) -> ItemView){
        //                              ^^ Diz que essa função vai ser chamada fora desse método (no body no caso)
        self.itens = itens
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.itens.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View{
        ForEach(itens){ item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = itens.index(of: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}
