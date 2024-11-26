//
//  RoundBlueButton.swift
//  Stopwatch
//
//  Created by Ganesh on 19/11/24.
//

import SwiftUI

struct RoundBlueButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            .tint(.blue)
            .foregroundStyle(.white)
    }
}
