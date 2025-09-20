//
//  KeyboardStroage.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

protocol KeyboardStorage {
    var keys: KeyboardKeyList { get set }
}

final class KeyboardStroageImpl: KeyboardStorage {
    var keys: KeyboardKeyList = KeyboardKeyList()
}
