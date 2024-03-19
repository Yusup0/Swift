//
//  RecipeList.swift
//  Team00
//
//  Created by Юсуп Оздоев on 09.01.2024.
//

import SwiftUI

struct RecipeList: View {
    @Environment(ModelData.self) var modelData
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.recipe) { recipe in
                    NavigationLink {
                        RecipeDetail(recipe: recipe)
                    } label: {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    RecipeList().environment(ModelData())
}
