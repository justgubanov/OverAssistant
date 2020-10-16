//
//  GameConditions.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public struct GameConditions {
    
    public enum OffenseSide: String {
        
        case attack
        case defence
        case symmetrical
    }
    
    var map: Map?
    var offenseSide: OffenseSide
    
    public init (map: Map? = nil, offenseSide: OffenseSide) {
        self.map = map
        self.offenseSide = offenseSide
    }
}
