//
//  Ability.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Foundation

enum AbilityType {
    case Ultimate
    case Passive
    case Active
}

enum AbilityTag {
    //for ultimate abilityes
    case Offensive
    case Defensive
    case Control
    case Special
    
    //for active and passive abilities
    case Pushing
}


class Ability: NSObject {
    var name: String
    var type: AbilityType
    var tags: [AbilityTag]
    
    var text: String = ""
    var imageId: String = ""
    
    
    init(name: String, type: AbilityType = .Active, tags: AbilityTag...) {
        self.name = name

        self.type = type
        self.tags = tags
    }
}

