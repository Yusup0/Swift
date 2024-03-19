//
//  main.swift
//  quest6
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> Int {
    var res = 0
    _ = firstCollection.subscribe {
        res += $0.count
    }.dispose()
    return res
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    print(await Filter(firstCollection))
}

await main()

