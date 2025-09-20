//
//  View+TextStyle.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

extension View {
    
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct TextStyle {
    
    struct Rounded: ViewModifier {
        
        @Environment(\.presentationData) var presentationData
        
        var size: CGFloat
        
        func body(content: Content) -> some View {
            content
                .font(.system(size: size, weight: .regular, design: .rounded))
        }
    }
}

extension ViewModifier where Self == TextStyle.Rounded {
    
    static func roundedText(size: CGFloat) -> TextStyle.Rounded {
        TextStyle.Rounded(size: size)
    }
}
