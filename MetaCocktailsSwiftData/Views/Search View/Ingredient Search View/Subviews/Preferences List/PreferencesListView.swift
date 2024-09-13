//
//  PreferencesListView.swift
//  MetaCocktailsSwiftData
//
//  Created by Matt Hunt on 8/14/24.
//

import SwiftUI

public struct PreferencesListView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isVisible = true
    
    public var body: some View {
        VStack {
            VStack {
                HStack {
                    FontFactory.mediumText("Selections", size: 20, color: Color.primary)
                    Text(" (tap to remove)")
                        .font(.subheadline)
                        .foregroundStyle(Color.secondary)
                        .opacity(isVisible ? 1 : 0)
                        .animation(.easeOut(duration: 0.75), value: isVisible)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isVisible = false
                            }
                        }
                    Spacer()
                    ResetSearchCriteriaButton()
                    
                }
                SelectedIngredientView(isPreferred: true, selections: viewModel.preferredSelections)
                SelectedIngredientView(isPreferred: false, selections: viewModel.unwantedSelections)
                
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle.init(cornerRadius: 12))
        }
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
    }
}

#Preview {
    PreferencesListView()
        .environmentObject(SearchViewModel())
}
