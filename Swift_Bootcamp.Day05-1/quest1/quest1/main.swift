//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 11.01.2024.
//

import Foundation
import RxSwift

func Filter(_ firstCollection: Observable<String>) async -> Observable<String> {
    return firstCollection.filter { $0.contains("e") }
}


func main() async {
    let bag = DisposeBag()
    let firstCollection = Observable.of("first", "second", "third")
    let newdCollection = await Filter(firstCollection)
    newdCollection.subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag)
}

await main()



