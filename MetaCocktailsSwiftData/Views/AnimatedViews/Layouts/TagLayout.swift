//
//  TagLayout.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/25/23.
//

import SwiftUI

struct TagLayout: Layout {
    // Layout properties
    var alignment: Alignment = .center // Horizontal & Vertical alignment is center.
    var spacing: CGFloat = 10 // Giving these values for previews
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? 0
        var height: CGFloat = 0
        let rows = generateRows(maxWidth, proposal, subviews)
        
        for (index, row) in rows.enumerated() {
            // Finding max heigh in each row and adding it to the view's total height
            if index == (rows.count - 1) {
                // Since there is no spacing needed for the last item
                height += row.maxHeight(proposal)
            } else {
                height += row.maxHeight(proposal) + spacing
            }
        }
        return .init(width: maxWidth, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var origin = bounds.origin
        let maxWidth = bounds.width
        let rows = generateRows(maxWidth, proposal, subviews)
        
       
        
        for row in rows {
            let leading: CGFloat = bounds.maxX - maxWidth
            let trailing = bounds.maxX - (row.reduce(CGFloat.zero) { partialResult, view in
                let width = view.sizeThatFits(proposal).width
                if view == row.last {
                    // no spacing
                    return partialResult + width
                }
                // with spacing
                return partialResult + width + spacing
            })
            let center = (trailing + leading) / 2 // since trailing is the farthest point, half this will be the center
            
            // For each row origin.x needs to be reset to zero
            origin.x = (alignment == .leading ? leading : alignment == .trailing ? trailing : center) // you can do these in threes now
            
            for view in row {
                let viewSize = view.sizeThatFits(proposal)
                view.place(at: origin, proposal: proposal)
                // update origin for new view
                origin.x += (viewSize.width + spacing)
            }
            //Update origin.y
            origin.y += (row.maxHeight(proposal) + spacing)
        }
        
    }
    
    // Generating rows based on available size.
    // each row is made up of a list of views for that row. Whenever the Row Origin is wider than the screen, we start a new row and add views to that instead.
    func generateRows(_ maxWidth: CGFloat, _ proposal: ProposedViewSize, _ subviews: Subviews) -> [[LayoutSubviews.Element]] {
        var row: [LayoutSubviews.Element]  = []
        var rows: [[LayoutSubviews.Element]] = []
        
        //Origin
        var origin = CGRect.zero.origin
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            
            // Pushing to new row
            if (origin.x + viewSize.width + spacing) > maxWidth {
                rows.append(row)
                row.removeAll()
                // Resetting X Orxigin since it needs to start from left to right
                origin.x = 0
                row.append(view)
                // Updating origin.x
                origin.x += (viewSize.width + spacing)
            } else {
                // Adding item to same row
                row.append(view)
                // Updating origin.x
                origin.x += (viewSize.width + spacing)
            }
        }
        
        // Checking for any exhaust row
        if !row.isEmpty {
            rows.append(row)
            row.removeAll()
        }
        return rows
    }
}

extension [LayoutSubviews.Element] {
    func maxHeight(_ proposal: ProposedViewSize) -> CGFloat {
        return self.compactMap { view in
            return view.sizeThatFits(proposal).height
        }.max() ?? 0
    }
}

#Preview {
    AnimatedSearchView()
}
