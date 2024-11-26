//
//  HourNumberView.swift
//  Stopwatch
//
//  Created by Ganesh on 26/11/24.
//

import SwiftUI

struct HourNumberView: View {
    var hour: Int
    var body: some View {
        VStack {
            Text("\(hour)")
                .bold()
                .rotationEffect(.degrees(-Double(30 * hour)))
            Spacer()
        }
        .rotationEffect(.degrees(Double(30 * hour)))
    }
}

#Preview {
    HourNumberView(hour: 5)
}
