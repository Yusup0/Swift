//
//  RecipeRow.swift
//  Team00
//
//  Created by Юсуп Оздоев on 09.01.2024.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe

    var body: some View {
        HStack {
            recipe.image
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(recipe.name)
            Spacer()
        }
    }
}

//#Preview {
//    RecipeRow(recipe: Recipe())
//}
