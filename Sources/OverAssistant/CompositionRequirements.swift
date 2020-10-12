//
//  CompositionPreference.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

class CompositionRequirements: NSObject {
    var teamHealth = 0 {
        didSet {
            if teamHealth < 0 { teamHealth = 0 }
        }
    }
    var teamDPS: Double = 0 {
        didSet {
            if teamDPS < 0 { teamDPS = 0 }
        }
    }
    var teamHPS: Double = 0 {
        didSet {
            if teamHPS < 0 { teamHPS = 0}
        }
    }
    
    var ultimatesList: [AbilityTag] = []
    var rangesList: [RangeType] = []
    var playstyleList: [Playstyle] = []
    
    init (for terms: GameConditions) {
        let mapName = terms.map
        let gameMode = terms.mode
        let side = terms.side
        

        switch mapName {
        case .Hanamura:
            if gameMode == .Assault && side == .Attack {
                teamHealth = 1600
                teamDPS = 1000
                teamHPS = 70
                ultimatesList = [.Defensive, .Defensive, .Control, .Offensive, .Offensive]
                rangesList = [.Close, .Long, .Long]
                playstyleList = [.Healer, .DamageAbsorber, .DamageAbsorber, .Flanker, .Flanker, .Assault]
            } else {
                teamHealth = 1300
                teamDPS = 1200
                teamHPS = 50
                ultimatesList = [.Defensive, .Defensive, .Offensive, .Control, .Offensive]
                rangesList = [.Close, .Long, .Close, .Long]
                playstyleList = [.Healer, .Choker, .Sniper, .DamageAbsorber, .DamageAbsorber, .Healer]
            }
        default:
            teamHealth = 1300
            teamDPS = 900
            teamHPS = 50
            ultimatesList = [.Defensive, .Defensive, .Offensive, .Control, .Offensive]
            rangesList = [.Close, .Long]
            playstyleList = [.Healer, .DamageAbsorber, .Assault, .DamageAbsorber, .Choker]
        }
    }
}
