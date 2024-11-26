//
//  Extension+Int.swift
//  Stopwatch
//
//  Created by Ganesh on 19/11/24.
//

import SwiftUI

extension Int {
    func writeTime() -> String {
        return String(format: "%02d", self)
    }
}

extension View {
    func roundedBlue() -> some View {
        modifier(RoundBlueButton())
    }
}
