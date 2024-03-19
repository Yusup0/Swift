//
//  RecipeDetail.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: RecipeEdit
    var body: some View {
        ScrollView {
            let uiImage = UIImage(data: recipe.image)
            let contend = uiImage == nil ?  CircleImage(image: Image(systemName: "photo.circle"), width: 200, height: 200) : CircleImage(image: Image(uiImage: uiImage!), width: 200, height: 200)
            contend
                .padding(.bottom, 20)
                .padding(.top, 20)
            Text(recipe.name)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            Text("Сooking method:").font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(0..<recipe.preparation.count, id: \.self) { i in
                Text("\nStep \(i + 1)")
                    .fontWeight(.light)
                    .font(.title3)
                Text(recipe.preparation[i])
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    return RecipeDetail(recipe: RecipeEdit())
}
