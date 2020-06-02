//
//  Pie.swift
//  MemoryGame
//
//  Created by Lucas Claro on 01/06/20.
//  Copyright © 2020 Lucas Claro. All rights reserved.
//

import SwiftUI

struct Pie : Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = CGFloat(min(rect.width, rect.height)) / 2
        let startPoint = CGPoint(
            x: center.x + cos(CGFloat(startAngle.radians)) * radius,
            y: center.y + sin(CGFloat(startAngle.radians)) * radius
        )
        
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: startPoint)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }
}
