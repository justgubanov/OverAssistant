//
//  ScoringBackground.swift
//  
//
//  Created by Александр Губанов on 16.10.2020.
//

import Foundation

public struct ScoringBackground {
    
    public var allies: [Hero]
    public var enemies: [Hero]
    
    public var targetProfile: Profile?
    public var conditions: GameConditions

    public init(allies: [Hero], enemies: [Hero], targetProfile: Profile? = nil, conditions: GameConditions) {
        self.allies = allies
        self.enemies = enemies
        self.targetProfile = targetProfile
        self.conditions = conditions
    }
}
