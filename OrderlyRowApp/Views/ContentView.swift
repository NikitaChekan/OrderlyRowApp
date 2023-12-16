//
//  ContentView.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPressed: Bool = false
    let squareCount: Int = 5
    
    var body: some View {
        GeometryReader { geometry in
            
            let mainLayout = isPressed ? AnyLayout(VStackLayout(spacing: 0)) : AnyLayout(HStackLayout(spacing: 3))
            let squaresLayout = isPressed ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            
            mainLayout {
                ForEach (0..<squareCount, id: \.self) { index in
                    squaresLayout {
                        createSquares(index: index, geometry: geometry)
                    }
                    .environment(\.layoutDirection, .leftToRight)
                }
                .onTapGesture {
                    withAnimation {
                        isPressed.toggle()
                    }
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
        }
    }
    
    func createSquares(index: Int, geometry: GeometryProxy) -> some View {
        
        let height = geometry.size.height / CGFloat(squareCount)
        let rightSpacer = CGFloat(index) * (geometry.size.width - height) / CGFloat(squareCount - 1)
        let leftSpacer = geometry.size.width - rightSpacer - height
        
        return HStack {
            
            Spacer()
                .frame(width: isPressed ? leftSpacer : 0)
            
            Rectangle()
                .cornerRadius(15)
                .foregroundStyle(.blue)
                .aspectRatio(contentMode: .fit)
            
            Spacer()
                .frame(width: isPressed ? rightSpacer : 0)
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
    
}

#Preview {
    ContentView()
}
