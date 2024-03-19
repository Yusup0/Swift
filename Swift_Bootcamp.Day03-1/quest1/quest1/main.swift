//
//  main.swift
//  quest1
//
//  Created by Юсуп Оздоев on 29.12.2023.
//

import Foundation

func main() {
    var revolver = RevolverMoonClip<Int>([4, 56, 2, 7, 54, 3])
    print(revolver.toStringDescription())
    print(revolver.pointer!)
    
    print(revolver[0])
    print(revolver[5])
    
    revolver.scroll()
    print(revolver.toStringDescription())
    print(revolver.pointer)
    
    revolver.shoot()
    revolver.shoot()
    revolver.shoot()
    revolver.shoot()
    print(revolver.toStringDescription())
    print(revolver.pointer)
    
    revolver.add([4, 6, 3, 22, 77, 43, 76, 5])
    print(revolver.toStringDescription())
    print(revolver.pointer)
    
    print(revolver.unloadAll().count)
    print(revolver.getSize())
    
    revolver.add([77, 43, 76, 5])
    print(revolver.toStringDescription())
    print(revolver.getSize())
    
    var other = RevolverMoonClip<Int>([77, 43, 76, 5])
    other.scroll()
    print(other == revolver)
    
}

main()
