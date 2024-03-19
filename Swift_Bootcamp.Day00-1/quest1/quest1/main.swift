//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 19.12.2023.
//
import Foundation

var data: [Double] = []
while data.count < 6 {
    let number = Double(readLine()!)
    if number == nil {
        print("The input is not a number")
    } else {
        data.append(number!)
    }
}

var distants: Double = (pow(data[0] - data[3], 2) + pow(data[1] - data[4], 2)).squareRoot()

if (distants + min(data[2], data[5]) <= max(data[2], data[5])) {
    print("One circle is inside another")
} else if distants <= data[2] + data[5] {
    print("The circles intersect")
} else {
    print("The circles is not intersect")
}


