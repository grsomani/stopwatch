//
//  ContentView.swift
//  Stopwatch
//
//  Created by Ganesh on 19/11/24.
//

import SwiftUI

struct StopwatchView: View {
    
    @ObservedObject var viewModel = StopwatchViewModel()
    private var smallMarkerLength = 10.0
    private var largeMarkerLength = 20.0
    var body: some View {
        VStack {
            ZStack() {
                Group {
                    Text("\(self.viewModel.minutes.writeTime()):")
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .fontWeight(.bold) +
                    Text("\(self.viewModel.seconds.writeTime()).\(self.viewModel.tenMilSeconds .writeTime())")
                        .foregroundStyle(.blue)
                        .font(.largeTitle)
                        .fontDesign(.monospaced)
                        .fontWeight(.bold)
                }
                .offset(y: -50)
                ForEach(0..<60) { marker in
                    let isHourMarker = marker == 0 || marker % 5 == 0
                    let markerLength = isHourMarker ? largeMarkerLength : smallMarkerLength
                    WatchMark(length: markerLength)
                        .stroke(lineWidth: isHourMarker ? 3.0 : 1.0)
                        .rotationEffect(.degrees(6.0 * Double(marker)))
                }
                ForEach(1..<13) { hour in
                    HourNumberView(hour: hour)
                }
                .padding(25)
                
                Circle().frame(width: 20)
                Circle()
                    .fill(.blue)
                    .frame(width: 10)
                
                //Seconds Hand
                WatchHand(topOffset: 20, backExtension: 20)
                    .fill(.blue)
                    .frame(width: 4, alignment: .center)
                    .rotationEffect(Angle(degrees: viewModel.secondsInDegree))
                
            }
            .padding(20)
            .frame(width: 350, height: 350)
            .background(.white)
            .clipShape(Circle())
            Spacer()
            HStack {
                Button(action: {
                    viewModel.isTimerRunning ? viewModel.pause() : viewModel.start()
                }, label: {
                    Image(systemName: viewModel.isTimerRunning ? "pause" : "play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(10)
                })
                .roundedBlue()
                
                Button(action: {
                    viewModel.reset()
                }, label: {
                    Image(systemName: "stop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(10)
                })
                .roundedBlue()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(.gray.gradient.tertiary)
    }
}

#Preview {
    StopwatchView()
}
