//
//  RecipeDetailEdit.swift
//  MyApp
//
//  Created by Юсуп Оздоев on 28.01.2024.
//

import SwiftUI
import PhotosUI

struct RecipeDetailEdit: View {
    @State var selectedItems: PhotosPickerItem?
    @Binding var recipe: RecipeEdit
    
    var body: some View {
        ScrollView {
            let uiImage = UIImage(data: recipe.image)
            let contend = uiImage == nil ?  CircleImage(image: Image(systemName: "photo.circle"), width: 200, height: 200) : CircleImage(image: Image(uiImage: uiImage!), width: 200, height: 200)
            contend
                .padding(.bottom, 20)
                .padding(.top, 20)
            PhotosPicker(selection: $selectedItems,
                         matching: .images, photoLibrary: .shared()) {
                Text("Choose a new photo")
            }.onChange(of: selectedItems) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        recipe.image = data
                    }
                }
            }
            TextField("Recipe name", text: $recipe.name, axis: .vertical)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            Text("Сooking method:").font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(0..<recipe.preparation.count, id: \.self) { i in
                Text("\nStep \(i + 1)")
                    .fontWeight(.light)
                    .font(.title3)
                TextField("", text: $recipe.preparation[i], axis: .vertical)
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    @State var r = RecipeEdit()
    return RecipeDetailEdit(recipe: $r)
}

