//
//  ContentView.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 14.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPressed: Bool = false
    let squareCount: Int = 3
    
    var body: some View {
        GeometryReader { geometry in
            if isPressed {
                VStack(spacing: 0) {
                    ForEach(0..<squareCount, id: \.self) { index in
                        createSquares(index: index, geometry: geometry)
                    }
                }
            } else {
                HStack(spacing: 3) {
                    ForEach(0..<squareCount, id: \.self) { index in
                        createSquares(index: index, geometry: geometry)
                    }
                }
            }
        }
        .onTapGesture {
            withAnimation {
                isPressed.toggle()
            }
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
