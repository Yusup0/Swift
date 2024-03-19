//
//  Recipe.swift
//  Team00
//
//  Created by Юсуп Оздоев on 07.01.2024.
//

import Foundation
import SwiftUI

struct ListResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case meals
    }
    let meals: [Recipe]
}

struct Recipe: Identifiable, Decodable {
    var id: String
    var name: String
    var description: String
    
    var ingredient = [String]()
    var measure = [String]()
    
    let pathImage: String
    var image: AsyncImage<Image>
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case description = "strInstructions"
        case pathImage = "strMealThumb"
        case strIngredient9 = "strIngredient16"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"

        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.pathImage = try container.decode(String.self, forKey: .pathImage)
        self.image = AsyncImage(url: URL(string: pathImage)) 
        for index in 1...8 {
            let str = try container.decode(String.self, forKey: Recipe.CodingKeys(rawValue: "strIngredient" + String(describing: index))!)
            if str.isEmpty {
                break
            }
            ingredient.append(str)
        }
        for index in 1...8 {
            let str = try container.decode(String.self, forKey: Recipe.CodingKeys(rawValue: "strMeasure" + String(describing: index))!)
            if str.isEmpty {
                break
            }
            measure.append(str)
        }

    }
    
}
