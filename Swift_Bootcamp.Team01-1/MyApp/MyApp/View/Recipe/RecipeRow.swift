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
            let uiImage = UIImage(data: recipe.image)
            let contend = uiImage == nil ?  CircleImage(image: Image(systemName: "photo.circle"), width: 60, height: 60) : CircleImage(image: Image(uiImage: uiImage!), width: 60, height: 60)
            contend
                .clipShape(Circle())
            Text(recipe.name)
            Spacer()
        }
    }
}

#Preview {
    RecipeRow(recipe: Recipe())
}
