//
//  Recipe.swift
//  Team00
//
//  Created by Юсуп Оздоев on 07.01.2024.
//

import Foundation
import SwiftUI
import RealmSwift

struct ListResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case meals
    }
    let meals: [RecipeModel]
}

class RecipeDataSource {
    private let realm = try! Realm()
    
    func Create(recipe: Recipe) -> Void {
        try! realm.write {
            realm.add(recipe, update: .all)
        }
    }
    
    func Read() -> Results<Recipe> {
        return realm.objects(Recipe.self)
    }
    
    func Update(name: String) {
        let recipes = Read()
        if recipes.isEmpty {
           return
        }
        let recipeToUpdate = recipes[0]
        try! realm.write {
            recipeToUpdate.name = name
        }
    }
    
    func Delete() {
        let recipes = Read()
        if recipes.isEmpty {
           return
        }
        let recipeToDelete = recipes[0]
        try! realm.write {
            realm.delete(recipeToDelete)
        }
    }
    
    func Serch(name: String) -> Results<Recipe> {
        let recipes = Read()
        let todosInProgress = recipes.where {
            $0.name == "Bistek"
        }
        return todosInProgress
    }
}

final class Recipe: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var urlString: String = ""
    @Persisted var preparation = RealmSwift.List<String>()
}

struct RecipeModel: Identifiable, Decodable {
    var id: String
    var name: String
    var description: String

    let pathImage: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case description = "strInstructions"
        case pathImage = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.pathImage = try container.decode(String.self, forKey: .pathImage)

    }
    
}
