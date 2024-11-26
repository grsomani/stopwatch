//
//  StopwatchViewModel.swift
//  Stopwatch
//
//  Created by Ganesh on 19/11/24.
//

import Foundation
import Combine

class StopwatchViewModel: ObservableObject {
    
    private var timer = Timer()
    private let cancellable = Set<AnyCancellable>()
    
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    @Published var tenMilSeconds: Int = 0

    @Published var secondsInDegree: Double = 0.0
    @Published var isTimerRunning = false
    
    func start() {
        self.isTimerRunning = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.tenMilSeconds += 1
            if self.tenMilSeconds >= 100 {
                self.seconds += 1
                self.tenMilSeconds = 0
            }
            
            if self.seconds >= 60 {
                self.minutes += 1
                self.seconds = 0
            }
            self.updateDegrees()
        }
    }
    
    func updateDegrees() {
        self.secondsInDegree = Double(seconds * 6) + Double(self.tenMilSeconds) * 0.06
    }
    
    func pause() {
        self.timer.invalidate()
        self.isTimerRunning = false
    }
    
    func reset() {
        self.timer.invalidate()
        self.isTimerRunning = false
        
        self.minutes = 0
        self.seconds = 0
        self.tenMilSeconds = 0
        
        self.secondsInDegree = 0.0
    }
}
