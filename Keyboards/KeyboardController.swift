//
//  KeyboardController.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

public final class KeyboardController: ObservableObject {
    
    private let storage: KeyboardStorage
    private let controlPanel: KeyboardControlPanel
    
    @Published private(set) public var display: KeyboardDisplay
    @Published private(set) public var error: KeyboardError?
    @Published private(set) public var logs: [KeyboardLog] = []
    
    public init() {
        storage = KeyboardStroageImpl()
        controlPanel = KeyboardControlPanelImpl()
        display = KeyboardDisplayImpl()
    }
    
    public func appendKey(_ key: KeyboardKey) {
        controlPanel.appendKey(key, to: storage.keys)
        display.text = storage.keys.text
    }
    
    public func delete() {
        controlPanel.delete(for: storage.keys)
        display.text = storage.keys.text
    }

    public func deleteAll() {
        controlPanel.clearAll(for: storage.keys)
        display.text = storage.keys.text
    }

    public func clearAll() {
        deleteAll()
        display.result = 0
    }

    public func execute() {
        if display.text.isEmpty {
            return
        }
        do {
            let result = try controlPanel.excute(for: storage.keys)
            display.result = result
            logs.append(KeyboardLogImpl(text: storage.keys.text, result: result))
        } catch let error as KeyboardError {
            self.error = error
        } catch {
            
        }
    }
}
