//
//  KeyboardKeyEditor.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

class KeyboardKeyEditor {
    func replace(
        _ keys: KeyboardKeyList,
        from head: KeyboardKeyNode,
        to tail: KeyboardKeyNode,
        with newKeys: KeyboardKeyList
    ) {
        keys.remove(from: head)
        if let head = newKeys.head {
            keys.append(from: head)
        }
        if let tailHead = tail.next {
            keys.append(from: tailHead)
        }
    }

    func replace(_ keys: KeyboardKeyList, withResult result: KeyboardCommandResult) {
        replace(keys, from: result.head, to: result.tail, with: result.newKeys)
    }
}
