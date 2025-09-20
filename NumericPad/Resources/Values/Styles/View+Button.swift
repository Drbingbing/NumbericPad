//
//  View+Button.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

struct NumericButtonStyle: ButtonStyle {
    
    var backgroundColor: Color
    var highlightBackgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(.roundedText(size: 20))
            .frame(width: 70, height: 36)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(configuration.isPressed ? highlightBackgroundColor : backgroundColor)
                    .shadow(
                        color: Color.black.opacity(0.2),
                        radius: 4,
                        x: 2,
                        y: 4
                    )
            }
            .scaleEffect(configuration.isPressed ? 0.92 : 1)
    }
}

extension ButtonStyle where Self == NumericButtonStyle {
    static func numeric(backgroundColor: Color, highlightBackgroundColor: Color) -> NumericButtonStyle {
        NumericButtonStyle(backgroundColor: backgroundColor, highlightBackgroundColor: highlightBackgroundColor)
    }
}

struct EnterButtonStyle: ButtonStyle {
    
    @Environment(\.presentationData) var presentationData
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textStyle(.roundedText(size: 20))
            .frame(width: 70, height: 140)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(configuration.isPressed ? Color.red.opacity(0.95) : Color.red)
                    .shadow(
                        color: Color.black.opacity(0.2),
                        radius: 4,
                        x: 2,
                        y: 4
                    )
            }
            .scaleEffect(configuration.isPressed ? 0.92 : 1)
            .foregroundStyle(presentationData.theme.miscellaneous.buttonTextColor)
    }
}

extension ButtonStyle where Self == EnterButtonStyle {
    static var enter: EnterButtonStyle { .init() }
}

#Preview {
    Button(action: {}) {
        Text("Preview")
    }
    .buttonStyle(.numeric(backgroundColor: .primary, highlightBackgroundColor: .secondary))
}
