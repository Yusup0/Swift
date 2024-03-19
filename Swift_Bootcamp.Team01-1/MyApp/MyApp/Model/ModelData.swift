//
//  ModelData.swift
//  Team00
//
//  Created by Юсуп Оздоев on 08.01.2024.
//
//cdefghijklmnopqrstuvwxyz
import Foundation
import SwiftUI
import RealmSwift
import Alamofire

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

class ModelData {
    private let chars = "abcdefghijklmnopqrstuvwxyz"
    private var intdex = 0
    
    func AddNewRecipe() {
        if intdex > 25 {
            return
        }
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/search.php?f=\(chars[intdex])") else { fatalError("Missing URL") }
        intdex += 1
        AF.request(url).responseDecodable(of: ListResponse.self) { response in
            switch response.result {
                case .success(let decodedData):
                    let bd = RealmManager()
                    for item in decodedData.meals {
                        if !bd.HaveId(id: item.id) {
                            bd.Add(recipe: item)
                            item.AddImageInBD()
                        }
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
