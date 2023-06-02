//
//  viewE.swift
//  Ames
//
//  Created by abner on 2/06/23.
//
//
import SwiftUI

struct viewE: View {
    @State private var points = 0
    @State private var timeRemaining = 10
    @State private var timerIsRunning = false

    var body: some View {
        VStack {
            Text("Points: \(points)")
                .font(.headline)
                .padding()
            
            Text("Time: \(timeRemaining)")
                .font(.headline)
                .padding()
            
            Button(action: {
                // Increment points when button is tapped
                points += 1
            }) {
                Text("Tap")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(timerIsRunning) // Disable button when timer is running
            
            Button(action: {
                // Start the timer
                startTimer()
            }) {
                Text("Start Timer")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(timerIsRunning) // Disable button when timer is already running
        }
    }
    
    private func startTimer() {
        timerIsRunning = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                timerIsRunning = false
            }
        }
    }
}

struct viewE_Previews: PreviewProvider {
    static var previews: some View {
        viewE()
    }
}

