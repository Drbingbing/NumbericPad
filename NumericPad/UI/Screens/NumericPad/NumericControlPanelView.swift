//
//  NumericControlPanelView.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI
import Keyboards

struct NumericControlPanelView: View {
    
    @EnvironmentObject var controlSate: KeyboardController
    
    var body: some View {
        VStack(alignment: .leading) {
            NumericFunctionsControlPanelView(
                onClearAll: clearAll,
                onAppendKey: appendKey
            )
            NumericBasicControlPanelView(
                onAppendKey: appendKey,
                onDeleteKey: deleteKey,
                onEnterKey: excute
            )
        }
    }
    
    func appendKey(_ key: KeyboardKey) {
        controlSate.appendKey(key)
    }
    
    func clearAll() {
        controlSate.clearAll()
    }
    
    func deleteKey() {
        controlSate.delete()
    }
    
    func excute() {
        controlSate.execute()
    }
}

struct NumericBasicControlPanelView: View {
    
    var onAppendKey: (KeyboardKey) -> Void
    var onDeleteKey: () -> Void
    var onEnterKey: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NumericKeyButton(key: .number(.seven), action: onAppendKey)
                NumericKeyButton(key: .number(.eight), action: onAppendKey)
                NumericKeyButton(key: .number(.nine), action: onAppendKey)
                NumericKeyButton(key: .operator(.plus), action: onAppendKey)
            }
            HStack(alignment: .top) {
                VStack {
                    HStack {
                        NumericKeyButton(key: .number(.four), action: onAppendKey)
                        NumericKeyButton(key: .number(.five), action: onAppendKey)
                        NumericKeyButton(key: .number(.six), action: onAppendKey)
                    }
                    HStack {
                        NumericKeyButton(key: .number(.one), action: onAppendKey)
                        NumericKeyButton(key: .number(.two), action: onAppendKey)
                        NumericKeyButton(key: .number(.three), action: onAppendKey)
                    }
                    HStack {
                        NumericKeyButton(key: .number(.dot), action: onAppendKey)
                        NumericKeyButton(key: .number(.zero), action: onAppendKey)
                        NumericErrorButton(action: onDeleteKey, text: "DEL")
                    }
                }
                NumericEnterButton(action: onEnterKey)
            }
        }
    }
}

struct NumericFunctionsControlPanelView: View {
    
    var onClearAll: () -> Void
    var onAppendKey: (KeyboardKey) -> Void
    
    var body: some View {
        VStack {
            HStack {
                NumericErrorButton(action: onClearAll, text: "AC")
                NumericKeyButton(key: .operator(.divide), action: onAppendKey)
                NumericKeyButton(key: .operator(.multiply), action: onAppendKey)
                NumericKeyButton(key: .operator(.minus), action: onAppendKey)
            }
        }
    }
}
