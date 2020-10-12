//
//  Coeffecient.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

enum Coeffecient: RawRepresentable {
    case Health
    case DPS
    case HPS
    case TimeOnFire
    case Favorite
    case Ultimate
    case Range
    case PlayStyle
    case Counter
    case NotCounter
    case Synergy
    case Ability
    
    init?(rawValue: (reason: String, value: Double)) {
        switch rawValue {
        case ("DPS", 0.001342): self = .DPS
        case ("HPS", 0.007246): self = .HPS
        case ("TimeOnFire", 0.011594): self = .TimeOnFire
        case ("Favorite", 0.043478): self = .Favorite
        
        case ("Health", 0.001318): self = .Health
        case ("Ultimate", 0.057971): self = .Ultimate
        case ("Range", 0.072464): self = .Range
        case ("PlayStyle", 0.072464): self = .PlayStyle
        case ("Ability", 0.028986): self = .Ability

        case ("Counter", 0.019324): self = .Counter
        case ("NotCounter", 0.014493): self = .NotCounter
        case ("Synergy", 0.036232): self = .Synergy
        default: return nil
        }
    }
    
    var rawValue: (reason: String, value: Double) {
        switch self {
        case .DPS: return ("DPS", 0.001342)
        case .HPS: return ("HPS", 0.007246)
        case .TimeOnFire: return ("TimeOnFire", 0.011594)
        case .Favorite: return ("Favorite", 0.043478)
        
        case .Health: return ("Health", 0.001318)
        case .Ultimate: return ("Ultimate", 0.057971)
        case .Range: return ("Range", 0.072464)
        case .PlayStyle: return ("PlayStyle", 0.072464)
        case .Ability: return ("Ability", 0.028986)
        
        case .Counter: return ("Counter", 0.019324)
        case .NotCounter: return ("NotCounter", 0.014493)
        case .Synergy: return ("Synergy", 0.036232)
        }
    }
    
    // TODO: Uncomment in Swift 5.1 realese
//    static subscript(key: Coeffecient) -> Int {
//        return key.rawValue.value
    
    static func Value(of key: Coeffecient) -> Double {
        return key.rawValue.value
  }
}


struct Score {
    var score: Double {
        return log.reduce(0) { $0 + $1.value }
    }
    
    private(set) var log = [String:Double]()
    
    mutating func Increase(with base: Double = 1, for purpose: Coeffecient) {
        let amount = base * Coeffecient.Value(of: purpose)
        let currentValue = log[purpose.rawValue.reason] ?? 0
        log.updateValue(currentValue + amount, forKey: purpose.rawValue.reason)
    }
}
