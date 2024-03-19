//
//  main.swift
//  quest4
//
//  Created by Юсуп Оздоев on 20.12.2023.
//

import Foundation

var size: Int = 0

var measurement: String!
var season: Character = " "
var temperature: Int = 0
var humidity: Int = 0

while size != 4 {
    let input = readLine()
    if size == 0 {
        if input != "Celsius" && input != "Fahrenheit" && input != "Kelvin" {
            print("Incorrect input. Enter a measurement:")
        } else {
            measurement = input
            size += 1
        }
    } else if size == 1 {
        if input != "S" && input != "W" {
            print("Incorrect input. Enter a season:")
        } else {
            season = Character(input!)
            size += 1
        }
    } else if size == 2 {
        if Int(input!) != nil {
            temperature = Int(input!)!
            size += 1
        } else {
            print("Incorrect input. Enter a temperature:")
        }
    } else {
        if Int(input!) != nil {
            humidity = Int(input!)!
            size += 1
        } else {
            print("Incorrect input. Enter a humidity:")
        }
    }
}

var new_temperature: Double = Double(temperature)
var min_temperature: Double = 22
var max_temperature: Double = 25
var min_humidity: Int = 30
var max_humidity: Int = 60
if measurement == "Fahrenheit" {
    new_temperature = 9.0 / 5.0 * Double(temperature) + 32.0
    min_temperature = 9.0 / 5.0 * min_temperature + 32.0
    max_temperature = 9.0 / 5.0 * max_temperature + 32.0
} else if measurement == "Kelvin" {
    new_temperature += 273.15
    min_temperature += 273.15
    max_temperature += 273.15
}
if season == "W" {
    max_humidity = 45
}

print("The temperature is \(new_temperature) \(measurement.first!).")
print("The comfortable temperature is from \(min_temperature) to \(max_temperature) \(measurement.first!).")
if min_temperature > new_temperature {
    print("Please, make it warmer by \(min_temperature - new_temperature) degrees.")
} else if new_temperature > max_temperature {
    print("Please, make it colder by \(new_temperature - max_temperature) degrees.")
} else {
    print("The temperature is comfortable.")
}
print("The comfortable humidity is from \(min_humidity)% to \(max_humidity)%")
if min_humidity > humidity {
    print("Please increase the humidity by \(min_humidity - humidity)%")
} else if humidity > max_humidity {
    print("Please reduce the humidity by \(humidity - max_humidity)%")
} else {
    print("The humidity is comfortable.")
}
