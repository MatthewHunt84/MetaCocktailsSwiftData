//
//  StandardButtonStyle.swift
//  MetaCocktails
//
//  Created by James on 8/9/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            
            .buttonStyle(.bordered)
            .controlSize(.large)
            .fontWeight(.bold)
            .frame(width: 200, height: 30)
            
            
            
           
            
        
    }
    
    
}
