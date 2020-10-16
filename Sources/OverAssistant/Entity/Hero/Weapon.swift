//
//  Weapon.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Foundation

public struct Weapon {
    
    enum Range: String {
        
        case close
        case medium
        case long
    }
    
    var name: String
    
    var primaryDamage: Int?
    var secondaryDamage: Int?
    
    var primaryRange: Range?
    var secondaryRange: Range?
    var effectiveRange: [Range]
    
    var magazineSize: Int = 0
    var reloadTime: Int = 0
    var fireRate: Int = 0
    
    init(name: String,
         primaryDamage: Int = 0,
         secondaryDamage: Int = 0,
         magazineSize: Int = 1,
         reloadTime: Int = 0,
         fireRate: Int = 1,
         range: Range...,
         primaryRange: Range? = nil,
         secondaryRange: Range? = nil ) {
        
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
