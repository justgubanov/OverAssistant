//
//  SessionRequirements.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public struct SessionRequirements {
    
    @NonNegative var teamHealth: Int = 0
    @NonNegative var teamDPS: Double = 0
    @NonNegative var teamHPS: Double = 0
    
    var ultimatesTags: Ability.TagSet = []
    var rangesList: [Weapon.Range] = []
    var playstyleList: [Hero.Playstyle] = []
    
    init (for terms: GameConditions) {
        let mapName = terms.map

        switch mapName {
//        case .hanamura:
//            if side == .attack {
//                teamHealth = 1600
//                teamDPS = 1000
//                teamHPS = 70
//                ultimatesTags = [.defensive, .defensive, .control, .offensive, .offensive]
//                rangesList = [.close, .long, .long]
//                playstyleList = [.healer, .DamageAbsorber, .DamageAbsorber, .Flanker, .Flanker, .Assault]
//            } else {
//                teamHealth = 1300
//                teamDPS = 1200
//                teamHPS = 50
//                ultimatesTags = [.defensive, .defensive, .offensive, .control, .offensive]
//                rangesList = [.close, .long, .close, .long]
//                playstyleList = [.healer, .Choker, .Sniper, .DamageAbsorber, .DamageAbsorber, .healer]
//            }
        default:
            teamHealth = 1300
            teamDPS = 900
            teamHPS = 50
            ultimatesTags = [.defensive, .defensive, .offensive, .control, .offensive]
            rangesList = [.close, .long]
            playstyleList = [.healer, .damageAbsorber, .assault, .damageAbsorber, .choker]
        }
    }
}
