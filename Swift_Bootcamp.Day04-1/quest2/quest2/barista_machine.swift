//
//  barista_machine.swift
//  quest2
//
//  Created by Юсуп Оздоев on 03.01.2024.
//

import Foundation

class BaristaMachine : IBarista {
    var model: String?
    var time: Int = 1
    func brew(_ coffee: Coffee!) {
        print("Coffee is brewing. \(String(describing: time)) minute - time left")
        print("Coffee is ready!")
    }
}
