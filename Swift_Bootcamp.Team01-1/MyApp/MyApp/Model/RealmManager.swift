//
//  RealmManager.swift
//  MyApp
//
//  Created by Юсуп Оздоев on 28.01.2024.
//

import Foundation
import RealmSwift

class RealmManager {
    private(set) var localRealm: Realm?

    init() {
        openRealm()
    }

    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func Read() -> Results<Recipe>? {
        return localRealm?.objects(Recipe.self)
    }

    func Add(recipe: Recipe) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    localRealm.add(recipe, update: .all)
                }
            } catch {
                print("Error adding task to Realm: \(error)")
            }
        }
    }

    func Update(id: String, name: String? = nil, preparation: RealmSwift.List<String>? = nil, pathImage: String? = nil, image: Data? = nil) {
        if let localRealm = localRealm {
            do {
                let recipeToUpdate = localRealm.objects(Recipe.self).filter(NSPredicate(format: "id == %@", id))
                guard !recipeToUpdate.isEmpty else { return }
                try localRealm.write {
                    if let name = name {
                        recipeToUpdate[0].name = name
                    }
                    if let preparation = preparation {
                        recipeToUpdate[0].preparation = preparation
                    }
                    if let pathImage = pathImage {
                        recipeToUpdate[0].pathImage = pathImage
                    }
                    if let image = image {
                        recipeToUpdate[0].image = image
                    }
                }
            } catch {
                print("Error updating task \(id) to Realm: \(error)")
            }
        }
    }
    
    func UpdateFromRecipe(recipe: RecipeEdit) {
        if let localRealm = localRealm {
            do {
                let recipeToUpdate = localRealm.objects(Recipe.self).filter(NSPredicate(format: "id == %@", recipe.id))
                guard !recipeToUpdate.isEmpty else { return }
                try localRealm.write {
                    recipeToUpdate[0].name = recipe.name
                    recipeToUpdate[0].preparation = recipe.preparation
                    recipeToUpdate[0].image = recipe.image
                    recipeToUpdate[0].pathImage = recipe.pathImage
                }
            } catch {
                print("Error updating task \(recipe.id) to Realm: \(error)")
            }
        }
    }

    func deleteTask(id: String) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Recipe.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else { return }
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                }
            } catch {
                print("Error deleting task \(id) to Realm: \(error)")
            }
        }
    }
    
    func BeginWrite() -> Bool {
        if let localRealm = localRealm {
            localRealm.beginWrite()
            return true
        }
        return false
    }
    
    func CommitWrite() {
        do {
            try localRealm?.commitWrite()
        } catch {
            print("Error commit task to Realm: \(error)")
        }
    }
    
    func HaveId(id: String) -> Bool {
        if let localRealm = localRealm {
            let task = localRealm.objects(Recipe.self).filter(NSPredicate(format: "id == %@", id))
            return !task.isEmpty
        }
        return false
    }
}
