//
//  Array+IndexOf.swift
//  MemoryGame
//
//  Created by Lucas Claro on 28/05/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func index(of item: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == item.id{
                return index
            }
        }
        return nil
    }
}
