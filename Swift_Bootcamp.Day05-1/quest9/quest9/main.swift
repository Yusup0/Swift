//
//  main.swift
//  quest9
//
//  Created by Юсуп Оздоев on 13.01.2024.
//

import Foundation
import RxSwift

struct Sample {
    let id: Int
    let text: String
}

//func Group(_ secondCollection: Observable<Sample>) async -> [[Sample]] {
//    var arr = [[Sample]]()
//    var map = [Int : [Sample]]()
//    _ = secondCollection.subscribe{
//        if map[$0.id] == nil {
//            map[$0.id] = [Sample]()
//        }
//        map[$0.id]?.append($0)
//    }
//    for value in map.sorted(by: {$0.key < $1.key}) {
//        arr.append(value.value)
//    }
//    return arr
//}

func Group(_ secondCollection: Observable<Sample>) async -> Observable<GroupedObservable<Int, Sample>> {
    return secondCollection.groupBy{ $0.id }
}


func main() async {
    
    let secondCollection = Observable.of(
            Sample(id: 3, text: "some text"),
            Sample(id: 1, text: "any text"),
            Sample(id: 2, text: "more text"),
            Sample(id: 2, text: "other text"),
            Sample(id: 3, text: "too text")
    )
    let res = await Group(secondCollection)
    _ = res.subscribe{
        if ($0.key == 3) {
            _ = $0.subscribe{
                if let element = $0.element {
                    print(element)
                }
            }
        }
    }
//    var arr = await Filter(secondCollection)
//    for value in arr {
//        print("\(value)")
//    }
}

await main()

