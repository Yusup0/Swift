//
//  main.swift
//  quest2
//
//  Created by Юсуп Оздоев on 29.12.2023.
//

import Foundation

func main() {
    var revolver = RevolverMoonClip(Caliber.c22)
    revolver.add([Patron(Caliber.c22, FeaturePatron.Combat), Patron(Caliber.c22, FeaturePatron.Blank)])
    var r = revolver.shoot()
    revolver.shoot()
    print(revolver.add(r))
    revolver.shoot()
    
    var patr = Patron(Caliber.c22, FeaturePatron.Combat)
    var revolver1 = RevolverMoonClip(Caliber.c22)
    var revolver2 = RevolverMoonClip(Caliber.c22)
    print(revolver1.add(patr))
    print(revolver2.add(patr))
    revolver1.shoot()
    revolver2.shoot()
    
    var patr1 = Patron(Caliber.c22, FeaturePatron.Combat)
    var arr_patr1 = [patr1, Patron(Caliber.c22, FeaturePatron.Combat), Patron(Caliber.c22, FeaturePatron.Combat)]
    var arr_patr2 = [patr1, Patron(Caliber.c22, FeaturePatron.Combat), Patron(Caliber.c45, FeaturePatron.Combat)]
    var revolver3 = RevolverMoonClip(Caliber.c22)
    var revolver4 = RevolverMoonClip(Caliber.c22)
    revolver3.add(arr_patr1)
    revolver4.add(arr_patr2)
    print(revolver3.toStringDescription())
    print(revolver4.toStringDescription())
}

main()
