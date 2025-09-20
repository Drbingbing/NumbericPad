//
//  NumericPadView.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI
import Keyboards

struct NumericPadView: View {
    
    @EnvironmentObject var controlSate: KeyboardController
    
    var body: some View {
        VStack(spacing: 12) {
            NumericPadScreenView(
                text: controlSate.display.text,
                logs: controlSate.logs
            )
            NumericControlPanelView()
        }
        .stackStyle(.numericKeyboard)
    }
}

#Preview {
    NumericPadView()
        .environmentObject(KeyboardController())
}


