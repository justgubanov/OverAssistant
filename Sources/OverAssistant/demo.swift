//
//  main.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Foundation

struct Demo {
    
    static func run() {
        let xogsnim = Profile(for: "Xogsnim", on: .PSN)
        sleep(10)
        
        Selector.playerProfile = xogsnim
        Selector.conditions = GameConditions(map: .Hanamura, mode: .Assault, side: .Attack)
        Selector.typeOfQueue = .Support
        
        Selector.enemies = [
            HeroCollection[.Tracer],
            HeroCollection[.Mercy],
            HeroCollection[.Winston],
            HeroCollection[.Junkrat]
        ]
        
        Selector.allies = [
            HeroCollection[.Soldier76],
            HeroCollection[.Roadhog],
            HeroCollection[.DVa]
        ]
        
        let options = Selector.rankedHeroes
        let sortedByScore = options.sorted { firstPick, secondPick in
            firstPick.value.value > secondPick.value.value
        }
        let topFive = sortedByScore.prefix(5)
        for (hero, score) in topFive {
            print(hero.name, score.value, score.sequence["DPS"] ?? 0)
        }
        
        print(HeroCollection.SelectBy(role: .Support).map {$0.name} )
    }
}
