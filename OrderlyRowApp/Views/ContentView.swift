//
//  ContentView.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button (action: buttonAction) {
            SquareView(squareCount: 10)
        }
    }
    
    private func buttonAction() {
        
    }
}

#Preview {
    ContentView()
}
