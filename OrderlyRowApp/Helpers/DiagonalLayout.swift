//
//  DiagonalLayout.swift
//  OrderlyRowApp
//
//  Created by jopootrivatel on 18.12.2023.
//

import Foundation
import SwiftUI

struct DiagonalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        let count = subviews.count
        let height = bounds.height / CGFloat(count)
        
        let wStep = (bounds.width - height) / CGFloat(count - 1)
        
        for (index, view) in subviews.enumerated() {
            view.place(
                at: .init(
                    x: CGFloat(index) * wStep + bounds.minX,
                    y: (bounds.maxY - height) - (height * CGFloat(index))
                ),
                proposal: .init(
                    width: height,
                    height: height
                )
            )
        }
    }
    
    
}
