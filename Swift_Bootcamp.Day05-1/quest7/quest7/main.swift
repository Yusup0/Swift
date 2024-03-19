//
//  main.swift
//  quest7
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> Int {
    var res = -1
    _ = firstCollection.subscribe {
        res += 1
        _ = $0
    }.dispose()
    return res
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    print(await Filter(firstCollection))
}

await main()

