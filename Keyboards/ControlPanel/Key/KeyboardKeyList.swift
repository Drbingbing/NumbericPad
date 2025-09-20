//
//  KeyboardKeyList.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

class KeyboardKeyNode {
    var key: KeyboardKey
    weak var prev: KeyboardKeyNode?
    var next: KeyboardKeyNode?

    init(key: KeyboardKey) {
        self.key = key
    }
}

final class KeyboardKeyList {
    
    private let entry: KeyboardKeyNode = KeyboardKeyNode(key: .number(.zero))
    private(set) var tail: KeyboardKeyNode?

    init() {}

    required init(_ head: KeyboardKeyNode) {
        append(from: head)
    }

    required init(_ keys: KeyboardKey...) {
        for key in keys {
            append(key)
        }
    }

    var head: KeyboardKeyNode? {
        return entry.next
    }

    func append(_ key: KeyboardKey) {
        append(from: KeyboardKeyNode(key: key))
    }

    func append(from node: KeyboardKeyNode) {
        node.prev = tail
        if entry.next == nil {
            tail = entry
        }
        tail?.next = node
        tail = KeyboardKeyTraveler().tail(of: node)
    }

    var text: String {
        var text = ""
        var node = entry.next
        outer: while true {
            guard let curr = node else {
                break outer
            }
            text.append(curr.key.description)
            node = curr.next
        }
        return text
    }

    func contains(_ node: KeyboardKeyNode) -> Bool {
        var curr = head
        while curr != nil {
            if curr === node {
                return true
            }
            curr = curr?.next
        }
        return false
    }

    func removeAll() {
        entry.next = nil
        tail = nil
    }

    func remove(from node: KeyboardKeyNode) {
        if !contains(node) {
            fatalError("Node doesn't added in list")
        }
        if let prev = node.prev {
            prev.next = nil
            tail = prev
        } else {
            removeAll()
        }
    }

    func popLast() -> KeyboardKeyNode? {
        guard let tail = tail else {
            return nil
        }
        remove(from: tail)
        return tail
    }
}

extension KeyboardKeyList: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = KeyboardKeyList()
        var node = self.head
        outer: while true {
            guard let curr = node else {
                break outer
            }
            copy.append(curr.key)
            node = curr.next
        }
        return copy
    }
}
