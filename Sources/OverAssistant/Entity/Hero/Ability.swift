//
//  Ability.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

struct Ability {
    
    enum Kind: Int {
        
        case ultimate
        case passive
        case active
    }

    struct TagSet: OptionSet {
        
        let rawValue: Int
        
        //for ultimate abilityes
        static let offensive = Self(rawValue: 1 << 0)
        static let defensive = Self(rawValue: 1 << 1)
        static let control = Self(rawValue: 1 << 2)
        static let special = Self(rawValue: 1 << 3)
        
        //for active and passive abilities
        static let pushing = Self(rawValue: 1 << 4)
    }
    
    var name: String
    var kind: Kind
    var tags: TagSet
}
