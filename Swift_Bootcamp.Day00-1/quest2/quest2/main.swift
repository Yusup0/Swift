//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 19.12.2023.
//

import Foundation

enum IntParsingError: Error {
    case invalidInput(String)
}

let order = readLine()
var number = Int(readLine()!)
if number == nil || !(order == "lower" ||  order == "higher") {
    throw IntParsingError.invalidInput("Invalid Input")
}

if order == "lower" {
    var res: Int = 0
    while number! != 0 {
        res = res * 10 + number! % 10
        print(res)
        number! /= 10
    }
} else {
    var copy: Int = number!
    var count_number: Int = 0
    while copy != 0 {
        copy /= 10
        count_number += 1
    }
    while count_number != 0 {
        count_number -= 1
        print(number! / Int(pow(10, Double(count_number))))
    }
}

