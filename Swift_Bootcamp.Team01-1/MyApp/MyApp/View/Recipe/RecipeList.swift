//
//  RecipeList.swift
//  Team00
//
//  Created by Юсуп Оздоев on 09.01.2024.
//

import SwiftUI
import RealmSwift

struct RecipeList: View {
    @ObservedResults(Recipe.self) var recipes
    let data =  ModelData()
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeHost(recipe: RecipeEdit(recipe: recipe))
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
                HStack {}
                    .onAppear {
                        data.AddNewRecipe()
                    }
            }
            .navigationTitle("Recipes")
            .listStyle(.inset)
        } detail: {
            Text("Select a Recipes")
        }
    }
}

#Preview {
    RecipeList()
}

