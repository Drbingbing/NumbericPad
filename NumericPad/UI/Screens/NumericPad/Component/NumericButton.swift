//
//  NumericButton.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

struct NumericButton<Label: View>: View {
    
    @Environment(\.presentationData) var presentationData
    
    var backgroundColor: Color? = nil
    var backgroundHighlightColor: Color? = nil
    
    var action: () -> Void
    var label: () -> Label
    
    var body: some View {
        Button(
            action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                action()
            },
            label: {
                label()
                    .foregroundStyle(presentationData.theme.miscellaneous.buttonTextColor)
                    .minimumScaleFactor(0.5)
            }
        )
        .buttonStyle(
            .numeric(
                backgroundColor: backgroundColor ?? presentationData.theme.miscellaneous.buttonBackground,
                highlightBackgroundColor: backgroundHighlightColor ?? presentationData.theme.miscellaneous.buttonHighlight
            )
        )
    }
}
