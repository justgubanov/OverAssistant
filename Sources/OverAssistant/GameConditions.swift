//
//  GameConditions.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

struct Map {
    
    enum Mode {
        
        case assault
        case escort
        case control
        case hybrid
        case push
    }
    
    let name: String
    let mode: Mode
}

struct GameConditions {
    
    enum OffenseSide: String {
        
        case attack
        case defence
        case symmetrical
    }
    
    var map: Map?
    var offenseSide: OffenseSide
    
    init (map: Map? = nil, offenseSide: OffenseSide) {
        self.map = map
        self.offenseSide = offenseSide
    }
}
