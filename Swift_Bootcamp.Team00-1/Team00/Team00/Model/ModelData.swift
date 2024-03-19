//
//  ModelData.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//

import Foundation
import SwiftUI

@Observable
class ModelData {
    var recipe: [Recipe] = []
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
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}

@Observable
class MyImagi {
    var image: Image
    init(url: String) {
        image = Image("")
        guard let url = URL(string: url) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                self.image = Image(uiImage: UIImage(data: data)!)
            }
        }
        dataTask.resume()
    }
}
