//
//  Recipe.swift
//  Team00
//
//  Created by Юсуп Оздоев on 07.01.2024.
//

import Foundation
import SwiftUI
import RealmSwift
import Alamofire

final class ListResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case meals
    }
    var meals: [Recipe]
}


final class Recipe: Object, Identifiable, Decodable {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var preparation = RealmSwift.List<String>()
    @Persisted var pathImage: String = ""
    @Persisted var image: Data = Data()
    
    static let `default` = Recipe()
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case desc = "strInstructions"
        case pathImage = "strMealThumb"
    }
    
    func AddImageInBD() {
        AF.request(self.pathImage).responseData { responseData in
            switch responseData.result {
            case .success(let value):
                RealmManager().Update(id: self.id, image: value )
            case .failure(let error):
                print(error)
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        let desc = try container.decode(String.self, forKey: .desc)
        for step in desc.split(whereSeparator: \.isNewline) {
            let line: String = String(step).trimmingCharacters(in: .whitespacesAndNewlines)
            if !line.isEmpty {
                self.preparation.append(line)
            }
        }
        self.pathImage = try container.decode(String.self, forKey: .pathImage)
    }
    
    override init() {}

}

struct RecipeEdit {
    var id: String = ""
    var name: String = ""
    var preparation = RealmSwift.List<String>()
    var pathImage: String = ""
    var image: Data = Data()
    
    static let `default` = RecipeEdit()
    
    init(recipe: Recipe) {
        self.id = recipe.id
        self.name = recipe.name
        self.preparation = RealmSwift.List<String>()
        for item in recipe.preparation {
            self.preparation.append(item)
        }
        self.pathImage = recipe.pathImage
        self.image = recipe.image
    }
    
    init() {
        self.id = "!23"
        self.name = "recipe.name"
        self.preparation = RealmSwift.List<String>()
        preparation.append("wqdsqwdqw dqww sdcwecwedcwe cwecwecwcw ecdcwdc")
        preparation.append("wqdsqwdqw dqww sdcwecwedcwe cwecwecwcw ecdcwdc")
        preparation.append("wqdsqwdqw dqww sdcwecwedcwe cwecwecwcw ecdcwdc")
        self.pathImage = "123"
    }
}
