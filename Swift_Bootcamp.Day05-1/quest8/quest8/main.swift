//
//  main.swift
//  quest8
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

func Filter(_ firstCollection: Observable<Sample>) async -> [String] {
    var res = Array<String>()
    _ = firstCollection.subscribe {
        res.append($0.text)
    }.dispose()
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
    
    print(await Filter(secondCollection))
}

await main()

