//
//  HealthStats.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public struct HealthStats {
    
    private var shield: Double = 0
    private var armour: Double = 0
    private var baseHealth: Double = 0
    
    var effectiveHealth: Int {
        let components: [(amount: Double, value: Double)] = [
            (amount: shield, value: 1.2),
            (amount: armour, value: 1.1),
            (amount: baseHealth, value: 1),
        ]
        
        let effectiveSum = components.reduce(0.0) { currentSum, component in
            let statWeight = component.amount * component.value
            return currentSum + statWeight
        }
        return Int(effectiveSum)
    }
    
    internal init(_ health: Int, armour: Int = 0, shield: Int = 0) {
        self.shield = Double(shield)
        self.armour = Double(armour)
        self.baseHealth = Double(health)
    }
}

extension HealthStats: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral baseHealth: Int) {
        self.baseHealth = Double(baseHealth)
    }
}
