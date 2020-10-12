//
//  Weapon.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

enum RangeType: String {
    case Close
    case Medium
    case Long
}

class Weapon: NSObject {
    var name: String
    
    var text: String = ""
    var imageId: String = ""
    
    var primaryDamage: Int?
    var secondaryDamage: Int?
    var primaryRange: RangeType?
    var secondaryRange: RangeType?
    var effectiveRange: [RangeType]
    
    var magazineSize: Int = 0
    var reloadTime: Int = 0
    var fireRate: Int = 0
    
    init(name: String, primaryDamage: Int = 0, secondaryDamage: Int = 0, magazineSize: Int = 1, reloadTime: Int = 0, fireRate: Int = 1, range: RangeType..., primaryRange: RangeType? = nil, secondaryRange: RangeType? = nil ) {
        
        self.name = name
        
        self.primaryDamage = primaryDamage
        self.secondaryDamage = secondaryDamage
        
        self.magazineSize = magazineSize
        self.reloadTime = reloadTime
        self.fireRate = fireRate
        
        self.primaryRange = primaryRange
        self.secondaryRange = secondaryRange
        self.effectiveRange = range
    }
}
