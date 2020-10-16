//
//  Coefficient.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public struct PickScore {
    
    var value: Double {
        return sequence.reduce(0) {
            $0 + $1.value
        }
    }
    
    private(set) var sequence: [ScoreFactor: Double] = [:]
    
    mutating func increase(with base: Double = 1, for factor: ScoreFactor) {
        let amount = base * factor.value
        let currentValue = sequence[factor] ?? 0
        sequence.updateValue(currentValue + amount, forKey: factor)
    }
}
