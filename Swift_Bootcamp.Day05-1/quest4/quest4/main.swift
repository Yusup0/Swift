//
//  main.swift
//  quest4
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> Bool? {
    do {
        return try await firstCollection.values.contains{ $0.count > 5 }
    } catch {
        return nil
    }
    
}

func main() async {
    let firstCollection = Observable.of("first", "second", "third")
    print(await Filter(firstCollection) ?? "Error")
}

await main()
