//
//  WatchShapes.swift
//  Stopwatch
//
//  Created by Ganesh on 26/11/24.
//

import SwiftUI

struct WatchMark: Shape {
    var length: Double = 1.0
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + length))
        return path
    }
}

struct WatchHand: Shape {
    var topOffset: Double = 0
    var backExtension: Double = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRect(CGRect(origin: CGPoint(x: rect.origin.x,
                                            y: rect.origin.y + topOffset),
                            size: CGSize(width: rect.width,
                                         height: rect.height/2 + backExtension - topOffset)))
        return path
    }
}
