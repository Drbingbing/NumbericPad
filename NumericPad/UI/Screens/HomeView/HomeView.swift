//
//  HomeView.swift
//  NumericPad
//
//  Created by BingBing on 2025/9/19.
//

import SwiftUI
import Keyboards

struct HomeView: View {
    
    @StateObject var controlState = KeyboardController()
    
    @Environment(\.presentationData) var presentationData
    
    var body: some View {
        VStack {
            NumericPadHeaderView()
            NumericPadViewContent()
        }
        .background(presentationData.theme.backgroundColor.primary)
        .environmentObject(controlState)
    }
}

private struct NumericPadHeaderView: View {
    
    var body: some View {
        HStack {
            HistoryButton()
            Spacer()
            FunctionsButton()
        }
        .padding(.horizontal, 20)
    }
    
    func FunctionsButton() -> some View {
        Button(action: {}) {
            Image(systemName: "circle.hexagonpath")
                .imageStyle(.iconImage)
        }
    }
    
    func HistoryButton() -> some View {
        Button(action: {}) {
            Image(systemName: "list.bullet")
                .imageStyle(.iconImage)
        }
    }
}

private struct NumericPadViewContent: View {
    var body: some View {
        NumericPadView()
    }
}

#Preview {
    HomeView()
}
