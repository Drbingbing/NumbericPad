//
//  KeyboardControlPanel.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

protocol KeyboardControlPanel {
    func appendKey(_ key: KeyboardKey, to keys: KeyboardKeyList)
    func delete(for keys: KeyboardKeyList)
    func clearAll(for keys: KeyboardKeyList)
    func excute(for keys: KeyboardKeyList) throws -> Double
}

final class KeyboardControlPanelImpl: KeyboardControlPanel {
    
    func appendKey(_ key: KeyboardKey, to keys: KeyboardKeyList) {
        keys.append(key)
    }
    
    func delete(for keys: KeyboardKeyList) {
        _ = keys.popLast()
    }
    
    func clearAll(for keys: KeyboardKeyList) {
        keys.removeAll()
    }
    
    func excute(for keys: KeyboardKeyList) throws -> Double {
        return try KeyboardExecutionImpl().execution(for: keys)
    }
}
