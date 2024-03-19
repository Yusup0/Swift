//
//  main.swift
//  quest10
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

func Group(_ secondCollection: Observable<Sample>) async -> [(Int, Int)]  {
    var map = [Int : Int]()
    _ = secondCollection.subscribe{
        map[$0.id] =  (map[$0.id] ?? 0) + 1
    }
    var res = [(Int, Int)]()
    for (key, value) in map.sorted(by: { $0.key < $1.key }) {
        res.append((key, value))
    }
    return res
}


func main() async {
    
    let secondCollection = Observable.of(
            Sample(id: 1, text: "some text"),
            Sample(id: 1, text: "any text"),
            Sample(id: 2, text: "more text"),
            Sample(id: 2, text: "other text"),
            Sample(id: 3, text: "too text")
    )
    print( await Group(secondCollection))
}

await main()

