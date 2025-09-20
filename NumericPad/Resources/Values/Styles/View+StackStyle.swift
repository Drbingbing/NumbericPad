//
//  View+StackStyle.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

extension View {
    func stackStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct StackStyle {
    
    struct NumericKeyboard: ViewModifier {
        
        @Environment(\.presentationData) var presentationData
        
        func body(content: Content) -> some View {
            content
                .padding(.all, 16)
                .background(presentationData.theme.backgroundColor.primary)
        }
    }
    
    struct NumericDisplayScreen: ViewModifier {
        
        @Environment(\.presentationData) var presentationData
        
        func body(content: Content) -> some View {
            content
                .frame(minHeight: 64)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(presentationData.theme.miscellaneous.screenBackground)
                        .shadow(
                            color: Color.black.opacity(0.2),
                            radius: 4,
                            x: 2,
                            y: 4
                        )
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(
                            presentationData.theme.primaryColor,
                            lineWidth: 2
                        )
                }
        }
    }
}

extension ViewModifier where Self == StackStyle.NumericKeyboard {
    static var numericKeyboard: StackStyle.NumericKeyboard {
        StackStyle.NumericKeyboard()
    }
}

extension ViewModifier where Self == StackStyle.NumericDisplayScreen {
    static var numericDisplayScreen: StackStyle.NumericDisplayScreen {
        StackStyle.NumericDisplayScreen()
    }
}
