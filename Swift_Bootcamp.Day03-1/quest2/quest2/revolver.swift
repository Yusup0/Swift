//
//  revolver.swift
//  quest1
//
//  Created by Юсуп Оздоев on 29.12.2023.
//

import Foundation

public extension RevolverMoonClip {
    func toStringDescription() -> String {
        var res = String(describing: self) + "\n"
        for value in clip {
            res += String(describing: value) + " "
        }
        return res
    }
}

public class RevolverMoonClip {
    private var clip = [Patron?](repeating: nil, count: 6)
    private var size = 0
    let caliber: Caliber
    var pointer: Patron? {
        get {
            return clip[0]
        }
    }
    
    init(_ caliber: Caliber) {
        self.caliber = caliber
    }
    
    public static func == (left: RevolverMoonClip, right: RevolverMoonClip) -> Bool {
        for first in (0..<6) {
            for second in (0..<6) {
                if left.clip[(first + second) % 6] != right.clip[second] {
                    break
                }
                if second == 5 {
                    return true
                }
            }
        }
        return false
    }
    
    subscript(index: Int) -> Patron? {
        get {
            return clip[index]
        }
        set(newValue) {
            clip[index] = newValue
        }
    }
    
    func getSize() -> Int {
        return size
    }
    
    func scroll() {
        let amount = Int.random(in: 1 ..< 6)
        clip = Array(clip[amount ..< 6] + clip[0 ..< amount])
    }
    
    func unloadAll() -> [Patron?]{
        let res = clip.map({ value -> Patron? in value?.used = false; return value })
        clip = [Patron?](repeating: nil, count: 6)
        size = 0
        return res
    }
    
    func unload(_ index: Int) -> Patron? {
        var res: Patron?
        if (0..<7).contains(index) {
            res = clip[index]
            clip[index] = nil
            res?.used = true
            size -= res != nil ? 1 : 0
        }
        return res
    }
    
    func shoot() -> Patron? {
        let res = clip[0]
        clip = Array(clip[1 ..< 6] + [nil])
        size -= res != nil ? 1 : 0
        if res != nil && res?.feature == FeaturePatron.Combat {
            res?.shoot()
        } else {
            print("Click")
        }
        return res
    }
    
    func add(_ patron: Patron?) -> Bool {
        if patron == nil || patron!.used || patron!.caliber != caliber {
            return false
        }
        for i in 0 ..< 6 {
            if clip[i] == nil {
                clip[i] = patron
                clip[i]?.used = true
                size += 1
                return true
            }
        }
        return false
    }
    
    func add(_ list: [Patron?]) -> Bool {
        if list.isEmpty || list.filter({$0 != nil}).isEmpty {
            return false
        }
        var i = 0
        while size < 6 && list.count > i {
            if list[i] == nil || list[i]!.used || list[i]?.caliber != caliber {
                i += 1
                continue
            }
            if clip[0] == nil {
                clip[0] = list[i]
                clip[0]?.used = true
                i += 1
                size += 1
            } else {
                clip = Array(clip[5 ..< 6] + clip[0 ..< 5])
            }
        }
        return true
    }
    
}


enum Caliber : Int {
    case c22 = 22
    case c38 = 38
    case c45 = 45
}

enum FeaturePatron {
    case Blank
    case Combat
}

class Patron: Equatable {
    let uuid = NSUUID().uuidString
    var caliber: Caliber
    var feature: FeaturePatron
    fileprivate var used: Bool = false
    init(_ caliber: Caliber, _ feature: FeaturePatron) {
        self.caliber = caliber
        self.feature = feature
    }
    
    func shoot() {
        print("Bang caliber \(caliber.rawValue)")
    }
    
    static func == (lhs: Patron, rhs: Patron) -> Bool {
        return lhs.caliber == rhs.caliber && lhs.feature == lhs.feature
    }
}
