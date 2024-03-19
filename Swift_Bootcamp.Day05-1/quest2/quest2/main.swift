//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> String? {
    do {
        return try await firstCollection.values.first{$0.contains("th")}
    } catch {
        return nil
    }
}


func main() async {
    let firstCollection = Observable.of("first", "second", "th", "third")
    let fierstString = await Filter(firstCollection)
    print(fierstString ?? "empty")
}

await main()

