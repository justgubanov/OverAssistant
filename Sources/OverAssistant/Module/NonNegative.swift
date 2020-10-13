//
//  NonNegative.swift
//  
//
//  Created by Александр Губанов on 12.10.2020.
//

import Foundation

@propertyWrapper
struct NonNegative<Value: Numeric & Comparable> {
    
    private var value: Value
    
    init(wrappedValue value: Value) {
        self.value = value
    }

    var wrappedValue: Value {
        get {
            return value
        }
        set {
            if newValue >= 0 {
                value = newValue
            } else {
                value = 0
            }
        }
    }
}
