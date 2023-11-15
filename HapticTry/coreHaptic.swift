//
//  coreHaptic.swift
//  HapticTry
//
//  Created by Datita Devindo Bahana on 15/11/23.
//

import Foundation
import CoreHaptics

class coreHaptic{
    private var hapticEngine: CHHapticEngine?
    init() {
        // Step 4: Check Haptic Support
        if CHHapticEngine.capabilitiesForHardware().supportsHaptics {
            // Step 5: Create a Haptic Engine
            do {
                self.hapticEngine = try CHHapticEngine()
            } catch {
                print("Error creating haptic engine: \(error)")
            }
        }
    }
    
    func triggerHapticFeedback() {
        do {
            try self.hapticEngine?.start()
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.6)
            let event = CHHapticEvent(eventType: .hapticContinuous, parameters: [intensity, sharpness], relativeTime: 0, duration: 0.2)
            
            let pattern = try CHHapticPattern(events: [event], parameters: [])
            let player = try self.hapticEngine?.makePlayer(with: pattern)
            
            try self.hapticEngine?.start()
            try player?.start(atTime: 0)
        } catch {
            print("Error starting haptic engine: \(error)")
        }
    }
}
