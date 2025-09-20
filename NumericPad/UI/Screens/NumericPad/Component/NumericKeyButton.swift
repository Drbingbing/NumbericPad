//
//  KeyButton.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI
import Keyboards

struct NumericKeyButton: View {
    
    var key: KeyboardKey
    var action: (KeyboardKey) -> Void
    
    var body: some View {
        NumericButton(
            action: { action(key) },
            label: { NumericKeyButtonLabel(key: key) }
        )
    }
}

private struct NumericKeyButtonLabel: View {
    
    var key: KeyboardKey
    
    var body: some View {
        switch key {
        case let .number(number):
            Text(number.rawValue)
        case let .operator(`operator`):
            switch `operator` {
            case .divide:
                Image(systemName: "divide")
            case .minus:
                Image(systemName: "minus")
            case .multiply:
                Image(systemName: "multiply")
            case .plus:
                Image(systemName: "plus")
            }
        }
    }
}

struct NumericPrimaryButton: View {
    
    var action: () -> Void
    var text: String
    
    var body: some View {
        NumericButton(
            action: action,
            label: { Text(text) }
        )
    }
}

struct NumericErrorButton: View {
    
    var action: () -> Void
    var text: String
    
    var body: some View {
        NumericButton(
            backgroundColor: Color.red,
            backgroundHighlightColor: Color.red.opacity(0.95),
            action: action,
            label: { Text(text) }
        )
    }
}

struct NumericEnterButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(
            action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                action()
            },
            label: {
                Image(systemName: "arrow.turn.down.left")
            }
        )
        .buttonStyle(.enter)
    }
}
