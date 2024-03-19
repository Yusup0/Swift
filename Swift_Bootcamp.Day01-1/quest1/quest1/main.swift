//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 21.12.2023.
//

import Foundation

enum AccidentType: String {
    case FIRE = "Fire"
    case GAS = "Gas leak"
    case CAT = "Cat on the tree"
}

enum DangerLevel {
    case LOW
    case MEDIUM
    case HIHT
}

struct Accident {
    let x: Int
    let y: Int
    var description: String?
    var applicant_number : String?
    var kind_accident: AccidentType?
}

struct Zona {
    var form: Figure
    var phone: String?
    var name: String?
    var dept: Int?
    var level: DangerLevel?
    func IsMineIncident(_ accident: Accident) -> Bool {
        return form.IsMine(Point(x: accident.x, y: accident.y))
    }
}

struct Point {
    var x: Int
    var y: Int
}

protocol Figure {
    func IsMine(_ point: Point) -> Bool
}

extension Figure {
    var type_name: String {
        return String(describing: type(of: self))
    }
}

struct Circle: Figure {
    let centr: Point
    let radius: Double
    func IsMine(_ point: Point) -> Bool {
        return Distance(a: point, b: centr) <= self.radius
    }
}

struct Triangle : Figure {
    let a: Point
    let b: Point
    let c: Point
    func IsMine(_ point: Point) -> Bool {
        let sq = Square(a: self.a, b: self.b, c: self.c)
        let ab = Square(a: self.a, b: self.b, c: point)
        let bc = Square(a: point, b: self.b, c: self.c)
        let ca = Square(a: self.a, b: point, c: self.c)
        return abs(sq - ab - bc - ca) <= 0.000001
    }
    
    private func Square(a: Point, b: Point, c: Point) -> Double {
        let ab = Distance(a: a, b: b)
        let bc = Distance(a: b, b: c)
        let ca = Distance(a: c, b: a)
        let p = (ab + bc + ca) / 2
        return (p * (p - ab) * (p - bc) * (p - ca)).squareRoot()
    }
}

struct Quadrilateral : Figure {
    let a: Point
    let b: Point
    let c: Point
    let d: Point
    func IsMine(_ point: Point) -> Bool {
        let first = Triangle(a: self.a, b: self.b, c: self.c).IsMine(point)
        let second = Triangle(a: self.c, b: self.d, c: self.a).IsMine(point)
        return first || second
    }
}

func Distance(a: Point, b: Point) -> Double {
    return (pow(Double(a.x - b.x), 2) + pow(Double(a.y - b.y), 2)).squareRoot()
}

func main() {
    var figure: Figure?
    var point: Point?
    
    if var line = readLine() {
        line = line.trimmingCharacters(in: .whitespacesAndNewlines)
        let data = line.split(separator: " ")
        if data.count == 2 {
            let numbers = data[0].split(separator: ";")
            if numbers.count == 2 && Int(numbers[0]) != nil && Int(numbers[1]) != nil && Double(data[1]) != nil {
                figure = Circle(centr: Point(x: Int(numbers[0])!, y: Int(numbers[1])!), radius: Double(data[1])!)
            }
        } else if data.count == 3 || data.count == 4 {
            var points = [Point]()
            for i in data {
                let numbers = i.split(separator: ";")
                if numbers.count == 2 && Int(numbers[0]) != nil && Int(numbers[1]) != nil {
                    points.append(Point(x: Int(numbers[0])!, y: Int(numbers[1])!))
                }
            }
            if points.count == 3 {
                figure = Triangle(a: points[0], b: points[1], c: points[2])
            } else if points.count == 4 {
                figure = Quadrilateral(a: points[0], b: points[1], c: points[2], d: points[3])
            }
        }
    }
    
    if var line = readLine() {
        line = line.trimmingCharacters(in: .whitespacesAndNewlines)
        let data = line.split(separator: ";")
        if data.count == 2 && Int(data[0]) != nil && Int(data[1]) != nil {
            point = Point(x: Int(data[0])!, y: Int(data[1])!)
        }
    }
    
    if figure == nil || point == nil {
        print("Error")
    } else {
        var zona = Zona(form: figure!)
        var accident = Accident(x: point!.x, y: point!.y)
        zona.phone = "89347362826"
        zona.name = "Sovetsky district"
        zona.dept = 49324
        zona.level = DangerLevel.LOW
        
        accident.description = "the woman said her cat can't get off the tree"
        accident.applicant_number = "+74832648573"
        accident.kind_accident = AccidentType.CAT
        
        print(zona.form.type_name)
        print(zona.name!)
        print(zona.phone!.NumberFormat())
        print(zona.dept!)
        print(zona.level!)
        if zona.IsMineIncident(accident) {
            print("There was an incident here")
        } else {
            var number = "88008473824"
            print("An accident is not in \(zona.name!)\nSwitch the applicant to the common number: \(number.NumberFormat())")
        }
        
    }
    
}

main()
