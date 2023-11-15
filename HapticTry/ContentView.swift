//
//  ContentView.swift
//  HapticTry
//
//  Created by Datita Devindo Bahana on 15/11/23.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    let hapticManager = coreHaptic()
    var body: some View {
            VStack {
                Text("Tap me for Haptic Feedback")
                    .onTapGesture {
                        self.hapticManager.triggerHapticFeedback()
                    }
            }
            .onAppear {
                // Additional setup if needed
            }
        }
}

#Preview {
    ContentView()
}
