//
//  CommandFactory.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

final class KeyboardCommandFactory {
    
    static let shared = KeyboardCommandFactory()
    
    func commandInstance(of key: KeyboardKey) -> KeyboardCommand {
        switch key {
        case .number:
            fatalError("Not supported number")
        case let .operator(`operator`):
            return operatorCommandInstance(of: `operator`)
        }
    }

    func operatorCommandInstance(of ope: KeyboardOperator) -> KeyboardCommand {
        switch ope {
        case .plus:
            return KeyboardPlusCommand()
        case .minus:
            return KeyboardMinusCommand()
        case .multiply:
            return KeyboardMultiplyCommand()
        case .divide:
            return KeyboardDivideCommand()
        }
    }
}
