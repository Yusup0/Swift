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
            if let r = value {
                res += String(describing: value!) + " "
            } else {
                res += "nil "
            }
            
        }
        return res
    }
}

public class RevolverMoonClip<T: Equatable> {
    private var clip = [T?](repeating: nil, count: 6)
    private var size = 0
    var pointer: T? {
        get {
            return clip[0]
        }
    }
    
    init(_ clip: [T] = [T]()) {
        add(clip)
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
    
    subscript(index: Int) -> T? {
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
    
    func unloadAll() -> [T?] {
        let res = clip
        clip = [T?](repeating: nil, count: 6)
        size = 0
        return res
    }
    
    func unload(_ index: Int) -> T? {
        var res: T?
        if (0..<7).contains(index) {
            res = clip[index]
            clip[index] = nil
            if res != nil {
                size -= 1
            }
        }
        return res
    }
    
    func shoot() -> T? {
        let res = clip[0]
        clip = Array(clip[1 ..< 6] + [nil])
        if res != nil {
            size -= 1
        }
        return res
    }
    
    func add(_ patron: T) -> Bool {
        for i in 0 ..< 6 {
            if clip[i] == nil {
                clip[i] = patron
                size += 1
                return true
            }
        }
        return false
    }
    
    func add(_ list: [T]) -> Bool {
        if list.isEmpty {
            return false
        }
        var i = 0
        while size < 6 && list.count > i {
            if clip[0] == nil {
                clip[0] = list[i]
                i += 1
                size += 1
            } else {
                clip = Array(clip[5 ..< 6] + clip[0 ..< 5])
            }
        }
        return true
    }
    
}
