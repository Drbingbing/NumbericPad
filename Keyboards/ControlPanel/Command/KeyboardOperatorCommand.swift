//
//  KeyboardOperatorCommand.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

class KeyboardOperatorCommand: KeyboardCommand {
    
    func execute(node: KeyboardKeyNode) throws -> KeyboardCommandResult {
        let head = try previousNumberHead(of: node)
        let left = try previousNumber(from: head, before: node)
        let tail = try nextNumberTail(of: node)
        let right = try nextNumber(after: node, to: tail)
        let answer = try answer(left: left, right: right)
        let newKeys = try KeyboardKeyConverter().convertKeys(from: answer)
        return KeyboardCommandResult(
            head: head,
            tail: tail,
            newKeys: newKeys
        )
    }
    
    private func number(from head: KeyboardKeyNode, to tail: KeyboardKeyNode) throws -> Double {
        return try KeyboardKeyConverter().convertNumber(from: head, to: tail)
    }

    func previousNumberType() -> KeyboardCommandType {
        return .exist
    }
    
    func previousNumberHead(of node: KeyboardKeyNode) throws -> KeyboardKeyNode {
        switch previousNumberType() {
        case .exist:
            guard let node = KeyboardKeyTraveler().prevNumberHead(of: node) else {
                throw KeyboardError.syntax
            }
            return node
        case .optional:
            return KeyboardKeyTraveler().prevNumberHead(of: node) ?? node
        case .notExist:
            guard let _ = KeyboardKeyTraveler().prevNumberHead(of: node) else {
                return node
            }
            throw KeyboardError.syntax
        }
    }
    
    func previousNumber(from head: KeyboardKeyNode, before node: KeyboardKeyNode) throws -> Double {
        switch previousNumberType() {
        case .exist:
            return try number(from: head, to: node.prev!)  // throw in previousNumberHead(of:)
        case .optional:
            if head === node {  // no previous number but previous key may exist
                return KeyboardCommandType.defaultNumber
            }
            return try number(from: head, to: node.prev!)
        case .notExist:
            return KeyboardCommandType.defaultNumber
        }
    }
    
    func nextNumberType() -> KeyboardCommandType {
        return .exist
    }
    
    func nextNumberTail(of node: KeyboardKeyNode) throws -> KeyboardKeyNode {
        switch nextNumberType() {
        case .exist:
            guard let node = KeyboardKeyTraveler().nextNumberTail(of: node) else {
                throw KeyboardError.syntax
            }
            return node
        case .optional:
            return KeyboardKeyTraveler().nextNumberTail(of: node) ?? node
        case .notExist:
            if let next = node.next, case .number = next.key {  // don't use CalculatorKeyTraveler.nextNumberTail(of:) i.e. 2^2+1, where "+" is not a sign
                throw KeyboardError.syntax
            }
            return node
        }
    }
    
    func nextNumber(after node: KeyboardKeyNode, to tail: KeyboardKeyNode) throws -> Double {
        switch nextNumberType() {
        case .exist:
            return try number(from: node.next!, to: tail)  // throw in nextNumberTail(of:)
        case .optional:
            if node === tail {  // no next number but next key may exist
                return KeyboardCommandType.defaultNumber
            }
            return try number(from: node.next!, to: tail)
        case .notExist:
            return KeyboardCommandType.defaultNumber
        }
    }
    
    func answer(left: Double, right: Double) throws -> Double {
        fatalError("Please override function without super.answer(left:right:params:)")
    }
    
    
}
