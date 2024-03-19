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
    var bd = RecipeDataSource()
    @State private var searchFilter = ""
    var body: some View {
        NavigationSplitView {
            List {
                Button("Удалить") {
                    bd.Delete()
                }
                Button("Обновить") {
                    bd.Update(name: "New name")
                }
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .searchable(text: $searchFilter,
                        collection: $recipes,
                        keyPath: \.name) {
                ForEach(recipes) { recipe in
                    Text(recipe.name).searchCompletion(recipe.name)
                }
            }
            .animation(.default, value: recipes)
            .navigationTitle("Recipes")
            
        } detail: {
            Text("Select a Recipes")
        }
    }
}

#Preview {
    RecipeList()
}
