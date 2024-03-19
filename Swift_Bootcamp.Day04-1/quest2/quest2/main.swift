//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

import Foundation

func main() {
    
    print("Choose barista:\n1. Man\n2. Machine")
    var barista = 0
    while(true) {
        if let choice = readLine(), let number = Int(choice), (1..<3).contains(number) {
            barista = number
            break
        } else {
            print("Try again!")
        }
    }
    let ratio: Double = barista == 1 ? 1 : 0.9
    let cappuccino = Coffee(name: "Cappuccino", cost: 2)
    let americano = Coffee(name: "Americano", cost: 1.5)
    let latte = Coffee(name: "Latte", cost: 2.3)
    let array_cof = [cappuccino, americano, latte]
    
    print("Choose coffee in menu:")
    for (i, value) in array_cof.enumerated() {
        print("\(i + 1). \(value!.name!) \(String(format:"%.2f", Double(truncating: value!.cost!) * ratio))$")
    }
    
    var coffee = 0
    while(true) {
        if let choice = readLine(), let number = Int(choice), (1..<array_cof.count + 1).contains(number) {
            coffee = number
            break
        } else {
            print("Try again!")
        }
    }
    var array_barista: [IBarista] = [Barista(), BaristaMachine()]
    array_barista[barista - 1].brew(array_cof[coffee - 1])
}

main()
