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
}
