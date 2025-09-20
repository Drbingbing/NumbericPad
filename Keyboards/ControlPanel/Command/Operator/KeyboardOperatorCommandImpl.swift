//
//  KeyboardOperatorCommands.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

final class KeyboardPlusCommand: KeyboardOperatorCommand {
    override func execute(node: KeyboardKeyNode) throws -> KeyboardCommandResult {
        if node.prev == nil && node.next != nil {
            return KeyboardCommandResult(head: node, tail: node, newKeys: KeyboardKeyList(KeyboardKeyNode(key: node.key)))
        }
        return try super.execute(node: node)
    }
    
    override func answer(left: Double, right: Double) throws -> Double {
        return left + right
    }
}

class KeyboardMinusCommand: KeyboardOperatorCommand {
    override func execute(node: KeyboardKeyNode) throws -> KeyboardCommandResult {
        if node.prev == nil && node.next != nil {
            return KeyboardCommandResult(head: node, tail: node, newKeys: KeyboardKeyList(KeyboardKeyNode(key: node.key)))
        }
        return try super.execute(node: node)
    }

    override func answer(left: Double, right: Double) throws -> Double {
        return left - right
    }
}

class KeyboardMultiplyCommand: KeyboardOperatorCommand {
    override func answer(left: Double, right: Double) throws -> Double {
        return left * right
    }
}

class KeyboardDivideCommand: KeyboardOperatorCommand {
    override func answer(left: Double, right: Double) throws -> Double {
        return left / right
    }
}
