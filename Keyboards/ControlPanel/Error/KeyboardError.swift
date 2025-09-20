//
//  KeyboardError.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

public enum KeyboardError: Error {
    case syntax
    case math
}

extension KeyboardError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .syntax:
            return "Syntax Error"
        case .math:
            return "Math Error"
        }
    }
}

