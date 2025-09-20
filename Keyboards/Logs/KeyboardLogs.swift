//
//  KeyboardLogs.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/20.
//

import Foundation

public protocol KeyboardLog {
    var id: String { get }
    var text: String { get }
    var result: Double { get }
}

final class KeyboardLogImpl: KeyboardLog {
    
    let id: String
    let text: String
    let result: Double
    
    init(id: String = UUID().uuidString, text: String, result: Double) {
        self.id = id
        self.text = text
        self.result = result
    }
}
