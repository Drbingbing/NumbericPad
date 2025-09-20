//
//  KeyboardKey.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

public enum KeyboardKey: Equatable, Hashable {
    case number(KeyboardNumber)
    case `operator`(KeyboardOperator)
}

extension KeyboardKey: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .number(number):
            return number.rawValue
        case let .operator(`operator`):
            return `operator`.rawValue
        }
    }
}

public enum KeyboardNumber: String, CaseIterable {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
}

public enum KeyboardOperator: String, CaseIterable {
    case plus = "+"
    case minus = "-"
    case multiply = "x"
    case divide = "÷"
}
