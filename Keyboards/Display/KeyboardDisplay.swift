//
//  KeyboardDisplay.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import Foundation

public protocol KeyboardDisplay {
    var text: String { get set }
    var result: Double { get set }
}

final class KeyboardDisplayImpl: KeyboardDisplay {
    var text: String = ""
    var result: Double = 0
}
