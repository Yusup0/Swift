//
//  RecipeHost.swift
//  MyApp
//
//  Created by Юсуп Оздоев on 28.01.2024.
//

import SwiftUI

struct RecipeHost: View {
    @Environment(\.editMode) var editMode
    @Environment(\.presentationMode) var presentation
    @State var recipe: RecipeEdit
    @State private var recipeDefault = RecipeEdit.default
    var body: some View {
        if editMode?.wrappedValue == .inactive {
            RecipeDetail(recipe: recipe)
        } else {
            RecipeDetailEdit(recipe: $recipeDefault)
                .onAppear {
                    recipeDefault = recipe 
                }
                .onDisappear {
                    recipe = recipeDefault
                    RealmManager().UpdateFromRecipe(recipe: recipeDefault)
                }
        }
        if editMode?.wrappedValue == .active {
            HStack {}
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button("Cancel") {
                    recipeDefault = recipe
                    editMode?.animation().wrappedValue = .inactive
                }, trailing: EditButton())
        }
        HStack {}
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: withAnimation {
                EditButton()
            })
    }
}

#Preview {
    RecipeHost(recipe: RecipeEdit())
}
