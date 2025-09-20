//
//  NumericPadScreenView.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI
import Keyboards

struct NumericPadScreenView: View {
    
    var text: String
    var logs: [any KeyboardLog]
    
    var body: some View {
        VStack {
            NumberPadDisplayScreenHistoryView(logs: logs)
            NumericPadDisplayScreenView(text: text)
        }
        .stackStyle(.numericDisplayScreen)
    }
}

private struct NumericPadDisplayScreenView: View {
    
    var text: String
    
    var content: some View {
        Text(text)
            .textStyle(.roundedText(size: 42))
            .frame(minHeight: 42)
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                content
                    .rotationEffect(.degrees(180))
                    .id(0)
            }
            .rotationEffect(.degrees(180))
            .onChange(of: text) { _, _ in
                proxy.scrollTo(0, anchor: .leading)
            }
        }
    }
}

private struct NumberPadDisplayScreenHistoryView: View {
    
    var logs: [any KeyboardLog]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(logs.indices, id: \.self) { index in
                        content(logs[index])
                    }
                }
                .rotationEffect(.degrees(180))
                .id(0)
            }
            .rotationEffect(.degrees(180))
            .onChange(of: logs.count) { _, _ in
                proxy.scrollTo(0, anchor: .top)
            }
        }
    }
    
    func content(_ log: any KeyboardLog) -> some View {
        Text(KeyboardNumberFormatter().string(equation: log.text, number: log.result))
            .tracking(2.0)
            .lineLimit(2)
            .truncationMode(.middle)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .textStyle(.roundedText(size: 20))
    }
}

private class KeyboardNumberFormatter {
    struct KeyboardFormattedNumber {
        var number: Double
        var power: Int
    }

    private let maxLength: Int = 10

    func truncatedText(from number: Double) -> String {
        return number.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", number) : String(number)
    }

    func isFormatNeeded(for number: Double) -> Bool {
        return number >= pow(10, Double(maxLength))
    }

    func formattedNumber(for number: Double) -> KeyboardFormattedNumber {
        var number = number
        var power = 0
        while number / 10 >= 1 {
            number /= 10
            power += 1
        }
        return KeyboardFormattedNumber(number: number, power: power)
    }

    func string(number: Double) -> String {
        var text = ""
        if !isFormatNeeded(for: number) {
            text += truncatedText(from: number)
        } else {
            let formattedNumber = formattedNumber(for: number)
            text += "\(truncatedText(from: formattedNumber.number))"
            text += "\(KeyboardKey.operator(.multiply).description)"
            text += "\(formattedNumber.power)"
        }
        return text
    }

    func string(equation: String, number: Double) -> String {
        return equation + "=" + string(number: number)
    }
}
