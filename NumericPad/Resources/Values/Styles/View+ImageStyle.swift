//
//  View+ImageStyle.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

extension View {
    
    func imageStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
    
}

struct ImageStyle {
    struct Icon: ViewModifier {
        
        @Environment(\.presentationData) var presentationData
        
        func body(content: Content) -> some View {
            content
                .frame(width: 28, height: 28)
                .foregroundStyle(presentationData.theme.primaryColor)
        }
    }
}

extension ViewModifier where Self == ImageStyle.Icon {
    static var iconImage: ImageStyle.Icon {
        ImageStyle.Icon()
    }
}
