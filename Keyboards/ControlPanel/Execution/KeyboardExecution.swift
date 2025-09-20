//
//  KeyboardExecution.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

protocol KeyboardExecution {
    func executeKeyboardKeys(_ keys: [KeyboardKey], for pressedKeys: KeyboardKeyList) throws -> KeyboardKeyList
    func simplifyPlusMinus(for keys: KeyboardKeyList) throws -> KeyboardKeyList
    func simplifyMultiplyDivide(for keys: KeyboardKeyList) throws -> KeyboardKeyList
    func execution(for keys: KeyboardKeyList) throws -> Double
}

extension KeyboardExecution {
    func executeKeyboardKeys(_ keys: [KeyboardKey], for pressedKeys: KeyboardKeyList) throws -> KeyboardKeyList {
        var node = pressedKeys.head
        while true {
            guard let curr = node else {
                break
            }
            if keys.contains(curr.key) {
                let command = KeyboardCommandFactory.shared.commandInstance(of: curr.key)
                let result = try command.execute(node: curr)
                KeyboardKeyEditor().replace(pressedKeys, withResult: result)
                node = result.newKeys.tail?.next
            } else {
                node = curr.next
            }
        }
        return pressedKeys
    }
}

final class KeyboardExecutionImpl: KeyboardExecution {
    
    func simplifyPlusMinus(for keys: KeyboardKeyList) throws -> KeyboardKeyList {
        return try executeKeyboardKeys(
            KeyboardKey.plusMinusCommandKeys,
            for: keys
        )
    }
    
    func simplifyMultiplyDivide(for keys: KeyboardKeyList) throws -> KeyboardKeyList {
        return try executeKeyboardKeys(
            KeyboardKey.multiplyDivideCommandKeys,
            for: keys
        )
    }
    
    func execution(for keys: KeyboardKeyList) throws -> Double {
        var newKeys = keys.copy() as! KeyboardKeyList
        newKeys = try simplifyMultiplyDivide(for: newKeys)
        newKeys = try simplifyPlusMinus(for: newKeys)
        return try KeyboardKeyConverter().convertNumber(for: newKeys)
    }
}
