//
//  Stats.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa


struct HealthStats {
    var shield = 0
    var health = 0
    var armor = 0
    
    var fullHealth: Int {
        return shield + health + armor
    }
}
