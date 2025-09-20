//
//  KeyboardCommand.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

struct KeyboardCommandResult {
    var head: KeyboardKeyNode
    var tail: KeyboardKeyNode
    var newKeys: KeyboardKeyList
}

enum KeyboardCommandType {
    static let defaultNumber: Double = 1
    case exist
    case optional
    case notExist
}

protocol KeyboardCommand {
    func execute(node: KeyboardKeyNode) throws -> KeyboardCommandResult
    func previousNumberType() -> KeyboardCommandType
    func previousNumberHead(of node: KeyboardKeyNode) throws -> KeyboardKeyNode
    func previousNumber(from head: KeyboardKeyNode, before node: KeyboardKeyNode) throws -> Double
    func nextNumberType() -> KeyboardCommandType
    func nextNumberTail(of node: KeyboardKeyNode) throws -> KeyboardKeyNode
    func nextNumber(after node: KeyboardKeyNode, to tail: KeyboardKeyNode) throws -> Double
    func answer(left: Double, right: Double) throws -> Double
}

// MARK: - CalculatorKey
extension KeyboardKey {
    static var plusMinusCommandKeys: [KeyboardKey] {
        return KeyboardOperator.allCases
            .filter { type in
                switch type {
                case .plus, .minus:
                    return true
                case .multiply, .divide:
                    return false
                }
            }
            .map { .operator($0) }
    }

    static var multiplyDivideCommandKeys: [KeyboardKey] {
        return KeyboardOperator.allCases
            .filter { type in
                switch type {
                case .plus, .minus:
                    return false
                case .multiply, .divide:
                    return true
                }
            }
            .map { .operator($0) }
    }
}
