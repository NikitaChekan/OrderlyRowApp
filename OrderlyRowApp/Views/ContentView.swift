//
//  ContentView.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var horizontal: Bool = true
    let squareCount: Int = 5
    
    var body: some View {
        
        let layout = horizontal ? AnyLayout(HStackLayout()) : AnyLayout(DiagonalLayout())
        
        layout {
            ForEach (0..<squareCount, id: \.self) { index in
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(
                        red: Double.random(in: 0...1),
                        green: Double.random(in: 0...1),
                        blue: Double.random(in: 0...1)
                    ))
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .onTapGesture {
            withAnimation {
                horizontal.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
