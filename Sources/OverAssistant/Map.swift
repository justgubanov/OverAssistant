//
//  Map.swift
//  
//
//  Created by Александр Губанов on 15.10.2020.
//

import Foundation

public struct Map {
    
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
