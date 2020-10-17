//
//  SynergyClass.swift
//  
//
//  Created by Александр Губанов on 17.10.2020.
//

import Foundation

enum SynergyStrength: Equatable {
    
    typealias SR = Int
    typealias LevelLimit = ClosedRange<SR>
    
    case good(levels: LevelLimit?)
    case best(levels: LevelLimit?)
    case undeniable
    
    static var best: SynergyStrength = .best(levels: nil)
    static var good: SynergyStrength = .good(levels: nil)
}

enum SynergyClass: Equatable {
    
    case abilityBased(value: SynergyStrength)
    case ultimateBased(value: SynergyStrength)
    case playStyleBased(value: SynergyStrength)
    
    static func == (lhs: SynergyClass, rhs: SynergyClass) -> Bool {
        switch (lhs, rhs) {
        case (.abilityBased(let strengthOne), .abilityBased(let strengthTwo)) where strengthOne == strengthTwo,
             (.ultimateBased(let strengthOne), .ultimateBased(let strengthTwo)) where strengthOne == strengthTwo,
             (.playStyleBased(let strengthOne), .playStyleBased(let strengthTwo)) where strengthOne == strengthTwo:
            return true
        default:
            return false
        }
    }
}
