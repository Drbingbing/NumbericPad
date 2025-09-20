//
//  PresentationData.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI

struct PresentationData: Equatable {
    
    var theme: PresentationTheme
    
    static func defaultValue() -> PresentationData {
        PresentationData(
            theme: PresentationTheme(
                primaryColor: .green,
                label: PresentationLabelTheme(
                    primary: .black,
                    secondary: .gray
                ),
                backgroundColor: PresentationBackgroundTheme(
                    primary: Color(red: 253/255, green: 255/255, blue: 252/255),
                    secondary: .secondary
                ),
                miscellaneous: PresentationMiscellaneous(
                    screenBackground: Color.green.opacity(0.3),
                    buttonHighlight: Color.green.opacity(0.95),
                    buttonBackground: Color.green,
                    buttonTextColor: Color.white,
                )
            )
        )
    }
}

struct PresentationTheme: Equatable {
    
    var primaryColor: Color
    var label: PresentationLabelTheme
    var backgroundColor: PresentationBackgroundTheme
    var miscellaneous: PresentationMiscellaneous
    
    init(
        primaryColor: Color,
        label: PresentationLabelTheme,
        backgroundColor: PresentationBackgroundTheme,
        miscellaneous: PresentationMiscellaneous
    ) {
        self.primaryColor = primaryColor
        self.label = label
        self.backgroundColor = backgroundColor
        self.miscellaneous = miscellaneous
    }
}

struct PresentationLabelTheme: Equatable {
    
    var primary: Color
    var secondary: Color
    
    init(primary: Color, secondary: Color) {
        self.primary = primary
        self.secondary = secondary
    }
}

struct PresentationBackgroundTheme: Equatable {
    
    var primary: Color
    var secondary: Color
    
    init(primary: Color, secondary: Color) {
        self.primary = primary
        self.secondary = secondary
    }
}

struct PresentationMiscellaneous: Equatable {
    
    var screenBackground: Color
    var buttonHighlight: Color
    var buttonBackground: Color
    var buttonTextColor: Color
    
    init(screenBackground: Color, buttonHighlight: Color, buttonBackground: Color, buttonTextColor: Color) {
        self.screenBackground = screenBackground
        self.buttonHighlight = buttonHighlight
        self.buttonBackground = buttonBackground
        self.buttonTextColor = buttonTextColor
    }
}

private struct PresentationDataKey: EnvironmentKey {
    static let defaultValue: PresentationData = .defaultValue()
}

extension EnvironmentValues {
    var presentationData: PresentationData {
        get { self[PresentationDataKey.self] }
        set { self[PresentationDataKey.self] = newValue }
    }
}
