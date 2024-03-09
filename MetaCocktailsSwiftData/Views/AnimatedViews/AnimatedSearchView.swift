//
//  AnimatedSearchView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 9/18/23.
//

import SwiftUI
import Observation

// Ignore this for now, just messing with an idea for tags

struct AnimatedSearchView: View {
    
    private var tags: [String] = {
        var array = [String]()
        for component in SearchCriteriaViewModel().cocktailComponents {
            array.append(component.name)
        }
        return array
    }()
    
    @State private var selectedTags: [String] = []
    
    // Matched Geometry Effect
    @Namespace private var animation
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(selectedTags, id: \.self) { tag in
                        TagView(tag, .green, "checkmark")
                            .matchedGeometryEffect(id: tag, in: animation)
                        // removing from selected list on tap
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedTags.removeAll(where: { $0 == tag })
                                }
                            }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)
                .padding(.vertical, 15)
            }
            
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
            .overlay(content: {
                if selectedTags.isEmpty {
                    Text("Select from the list below")
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            })
            
            .background(.black)
            
            
        }
        
        .preferredColorScheme(.dark)
        .zIndex(1)
        
        ScrollView(.vertical) {
            TagLayout(alignment: .center, spacing: 10) {
                ForEach(tags.filter { !selectedTags.contains($0) }, id: \.self) { tag in
                    TagView(tag, .blue, "plus")
                        .matchedGeometryEffect(id: tag, in: animation)
                        .onTapGesture {
                            // Add selected tag to list
                            withAnimation(.snappy) {
                                selectedTags.insert(tag, at: 0)
                            }
                        }
                }
            }
        }
        .scrollClipDisabled(true)
        .scrollIndicators(.hidden)
        .background(.white.opacity(0.1))
        .zIndex(0)
       
        
        ZStack {
            Button(action: {}, label: {
                 Text("Search")
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
                    .background(Color.pink.gradient)
                    .clipShape(.rect(cornerRadius: 12))


            })
            .disabled(selectedTags.isEmpty)
            .opacity(selectedTags.isEmpty ? 0.5 : 1)
            .padding()
        }
        .background(.black)
        .zIndex(2)
    
    }
    
    @ViewBuilder func TagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
            
            Image(systemName: icon)
        }
        .frame(height: 35)
        .foregroundStyle(.black)
        .padding(.horizontal, 15)
        .background {
            Capsule()
                .fill(color.gradient)
        }
        
    }
}




#Preview {
    AnimatedSearchView()
}
