//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 24.12.2023.
//

import Foundation

public extension String {
    
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
    
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound, range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }
    
    mutating func NumberFormat() -> String {
        var my_copy: String = self
        if my_copy.count == 12 && my_copy.first == "+" {
            my_copy.remove(at: my_copy.startIndex)
        }
        if my_copy.count == 11 && my_copy.isNumber && (my_copy.first == "7" || my_copy.first == "8") {
            var res = ""
            if my_copy[1..<4] == "800" {
                res = "8 (800) " + my_copy[4..<7] + " " + my_copy[7..<9] + " " + my_copy[9..<11]
            } else {
                res = "+7 " + my_copy[1..<4] + " " + my_copy[4..<7] + "-" + my_copy[7..<9] + "-" + my_copy[9..<11]
            }
            swap(&self, &res)
        }
        return self
    }
}
