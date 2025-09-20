//
//  KeyboardKeyConverter.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

final class KeyboardKeyConverter {
    
    func convertNumber(from head: KeyboardKeyNode, to tail: KeyboardKeyNode) throws -> Double {
        var string = ""
        var node: KeyboardKeyNode? = head
        while true {
            guard let curr = node else {
                throw KeyboardError.syntax
            }
            switch curr.key {
            case .number(let number):
                string += number.rawValue
                node = curr.next
            case .operator(let `operator`):
                switch `operator` {
                case .plus, .minus:
                    if curr === head && curr.next == nil {  // +/- only
                        throw KeyboardError.syntax
                    }
                    if let prev = curr.prev, case .number = prev.key {  // 123+45
                        throw KeyboardError.syntax
                    }
                    if `operator` == .minus {  // add/remove "-"
                        if string.isEmpty {
                            string += `operator`.rawValue
                        } else {
                            _ = string.popLast()
                        }
                    }
                    node = curr.next
                case .multiply, .divide:
                    throw KeyboardError.syntax
                }
            }

            if curr === tail {
                break  // end
            }
        }
        guard let number = Double(string) else {  // 123..45
            throw KeyboardError.syntax
        }
        return number
    }

    func convertNumber(for keys: KeyboardKeyList) throws -> Double {
        guard let head = keys.head, let tail = keys.tail else {
            return 0  // empty list
        }
        return try convertNumber(from: head, to: tail)
    }

    func convertKeys(from number: Double) throws -> KeyboardKeyList {
        let keys = KeyboardKeyList()
        let string = number.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", number) : String(number)
        for char in string {
            if String(char) == KeyboardOperator.minus.rawValue {
                keys.append(.operator(.minus))
                continue
            }
            guard let number = KeyboardNumber(rawValue: "\(char)") else {
                throw KeyboardError.math
            }
            keys.append(KeyboardKey.number(number))
        }
        return keys
    }
}
