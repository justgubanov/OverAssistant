//
//  ScoreFactor.swift
//  
//
//  Created by Александр Губанов on 15.10.2020.
//

public enum ScoreFactor: String {
    
    case healthProvider
    case dps
    case hps
    case timeOnFire
    case beingFavourite
    case havingSuitableAbility
    case havingSuitableUltimate
    case havingSuitableRange
    case playStyle
    case countering
    case notBeingCountered
    case teamSynergy
    
    var value: Double {
        switch self {
        case .dps:
            return 0.001342
        case .hps:
            return 0.007246
        case .timeOnFire:
            return 0.011594
        case .beingFavourite:
            return 0.043478
        
        case .healthProvider:
            return 0.001318
        case .havingSuitableUltimate:
            return 0.057971
        case .havingSuitableRange:
            return 0.072464
        case .playStyle:
            return 0.072464
        case .havingSuitableAbility:
            return 0.028986
        
        case .countering:
            return 0.019324
        case .notBeingCountered:
            return 0.014493
        case .teamSynergy:
            return 0.036232
        }
    }
}
