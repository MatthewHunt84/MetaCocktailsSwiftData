//
//  SearchResultsView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 11/26/23.
//

import SwiftUI

struct SearchResultsView: View {
    
    var viewModel: SearchCriteriaViewModel

    
    //    ALL THESE PROPERTIES CAN LIVE IN THE VIEWMODEL EVENTUALLY, BUT THEY'RE HERE FOR NOW.
    
    var matched: Int = 5
    var searched: Int = 5
    
    //    @State private var preferredTags = Tags(flavors: [.lemon, .ginger, .chocolate])
    //    @State private var  unwantedTags = Tags(flavors: [.almond])
        

    
    @State private var selectedTagExamples: [String] = ["lemon", "ginger", "chocolate"] // placeholders for example.

    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Your Selections (tap to remove)")
//                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.leading, 20)
                .padding(.top, 25)

            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(selectedTagExamples, id: \.self) { tag in
                        TagView(tag, .green, "xmark")
//                            .matchedGeometryEffect(id: tag, in: animation)
                        // removing from selected list on tap
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedTagExamples.removeAll(where: { $0 == tag })
                                }
                            }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 35)

            }
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
            
            List {
                Section(header: SearchedCocktailTitleHeader(searched: 5, matched: 5)) {
                    SearchedCocktailCell()
                    SearchedCocktailCell()
                }
                
                
                Section(header: SearchedCocktailTitleHeader(searched: 5, matched: 4)) {
                    SearchedCocktailCell()

                }
                
                Section(header: SearchedCocktailTitleHeader(searched: 5, matched: 3)) {
                    SearchedCocktailCell()

                }
            }
            .listStyle(.grouped)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder func TagView(_ tag: String, _ color: Color, _ icon: String) -> some View {
        HStack(spacing: 10) {
            Text(tag)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Image(systemName: icon)
                .fontWeight(.heavy)
                .foregroundColor(.white)
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

struct SearchedCocktailTitleHeader: View {
    
    var searched: Int
    var matched: Int
    
    var body: some View {
        HStack {
            
            ForEach(0..<matched) { match in
                Image(systemName: "circle.fill")
                    .foregroundStyle(Color.green)
            }
            
            if matched - searched < 0 {
                ForEach(0..<(searched - matched)) { nonMatch in
                    Image(systemName: "circle.fill")
                    
                }
            }
            
            Spacer()
            
            Text("^[\(matched)/\(searched) matches](inflect: true)")
        }
    }
}

struct SearchedCocktailCell: View {
    
//    @State var isExpanded = false
    
    var body: some View {
        VStack {
            Text("Cocktail name")
        }
//        .frame(height: isExpanded ? 100 : 20)
//        .onTapGesture {
//            isExpanded.toggle()
//        }
//        .animation(.easeInOut(duration: 0.5))
    }
}

#Preview {
    SearchResultsView(viewModel: SearchCriteriaViewModel())
}
