//
//  main.swift
//  quest5
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> Bool? {
    do {
        return try await firstCollection.values.allSatisfy{ !$0.isEmpty }
    } catch {
        return nil
    }
    
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    print(await Filter(firstCollection) ?? "Error")
}

await main()


