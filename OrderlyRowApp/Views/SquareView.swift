//
//  SquareView.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 14.12.2023.
//

import SwiftUI

struct SquareView: View {
    
    @State var squareCount: Int
    
    var body: some View {
        GeometryReader { geometry in
            
            let spacing: CGFloat = 10
            let width = geometry.size.width
            
            HStack(spacing: spacing) {
                ForEach(0..<squareCount, id: \.self) { _ in
                    Rectangle()
                        .cornerRadius(5)
                        .foregroundColor(.blue)
                        .frame(
                            width: (width - spacing * CGFloat(squareCount - 1)) / CGFloat(squareCount),
                            height: (width - spacing * CGFloat(squareCount - 1)) / CGFloat(squareCount)
                        )
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    SquareView(squareCount: 7)
}

