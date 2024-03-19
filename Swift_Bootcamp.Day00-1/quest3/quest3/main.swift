//
//  main.swift
//  quest3
//
//  Created by Юсуп Оздоев on 20.12.2023.
//

import Foundation

var size: Int = 0

var measurement: String = ""
var season: Character = " "
var temperature: Int = 0

while size != 3 {
    let input = readLine()
    if size == 0 {
        if input != "Celsius" && input != "Fahrenheit" && input != "Kelvin" {
            print("Incorrect input. Enter a measurement:")
        } else {
            measurement = input!
            size += 1
        }
    } else if size == 1 {
        if input != "S" && input != "W" {
            print("Incorrect input. Enter a season:")
        } else {
            season = Character(input!)
            size += 1
        }
    } else {
        if Int(input!) != nil {
            temperature = Int(input!)!
            size += 1
        } else {
            print("Incorrect input. Enter a temperature:")
        }
    }
}

var new_temperature: Double = Double(temperature)
var min_normal: Double = 22
var max_normal: Double = 25
if measurement == "Fahrenheit" {
    new_temperature = 9.0 / 5.0 * Double(temperature) + 32.0
    min_normal = 9.0 / 5.0 * min_normal + 32.0
    max_normal = 9.0 / 5.0 * max_normal + 32.0
} else if measurement == "Kelvin" {
    new_temperature += 273.15
    min_normal += 273.15
    max_normal += 273.15
}

print("The temperature is \(new_temperature) \(measurement.first!).")
print("The comfortable temperature is from \(min_normal) to \(max_normal) \(measurement.first!).")
if min_normal > new_temperature {
    print("Please, make it warmer by \(min_normal - new_temperature) degrees.")
} else if new_temperature > max_normal {
    print("Please, make it colder by \(new_temperature - max_normal) degrees.")
} else {
    print("The temperature is comfortable.")
}

