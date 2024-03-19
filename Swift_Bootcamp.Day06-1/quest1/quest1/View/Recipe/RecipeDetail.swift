//
//  RecipeDetail.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            CircleImage(urlPath: recipe.urlString)
                .frame(width: 200, height: 200)
                .offset(y: 20)
                .padding(.bottom, 20)
            Text(recipe.name)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
//            Divider()
//            Text("Structure:").font(.title2)
//                .frame(maxWidth: .infinity, alignment: .leading)
//            ForEach(0..<recipe.ingredient.count) { i in
//                HStack {
//                    Text("•").font(.title)
//                    Text("\(recipe.ingredient[i]) - \(recipe.measure[i])")
//                        .font(.title3)
//                        .fontWeight(.light)
//                    Spacer()
//                }
//            }
            Divider()
            Text("Сooking method:").font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(0..<recipe.preparation.count) { i in
                Text("Step \(i + 1)")
                    .fontWeight(.light)
                    .font(.title3)
                Text(recipe.preparation[i])
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding(.horizontal)
    }
}

//#Preview {
//    return RecipeDetail(recipe: Recipe())
//}
