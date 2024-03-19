//
//  ModelData.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import Foundation
import SwiftUI
import RealmSwift

@Observable
class ModelData {
    var recipe: [RecipeModel] = []
    init() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/search.php?f=b") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(ListResponse.self, from: data)
                        self.recipe = decodedUsers.meals
                        let bd = RecipeDataSource()
                        for recipe in self.recipe {
                            let recipeData = Recipe()
                            recipeData.id = recipe.id
                            recipeData.name = recipe.name
                            recipeData.urlString = recipe.pathImage
                            for i in recipe.description.split(whereSeparator: \.isNewline) {
                                let line: String = String(i).trimmingCharacters(in: .whitespacesAndNewlines)
                                if !line.isEmpty {
                                    recipeData.preparation.append(line)
                                }
                            }
                            bd.Create(recipe: recipeData)
                        }
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}

