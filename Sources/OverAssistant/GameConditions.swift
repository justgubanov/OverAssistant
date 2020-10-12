//
//  GameConditions.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

enum Map: String {
    case Hanamura
    case HorizonLunarColony
    //  Temple of Anubis    Volskaya Industries    Dorado    Junkertown    Rialto    Route 66    Watchpoint: Gibraltar    Ilios: Ruins    Ilios: Lighthouse    Ilios: Well    Lijiang: Market    Lijiang: Garden    Lijiang: Control Center    Nepal: Village    Nepal: Shrine    Nepal: Sanctum    Oasis: City Center    Oasis: Gardens    Oasis: University    Busan: Sanctuary    Busan: Downtown    Busan: MEKA Base    Blizzard World    Eichenwalde    Hollywood    King’s Row    Numbani
}

enum MapMode {
    case Assault// = ("Point A", "Point B")
    case Escort //= (
    case Control//(String, String, String)
    case Hybrid
}

enum Side: String {
    case Attack
    case Defence
    case Redundant
}

class GameConditions: NSObject {
    var map: Map
    var mode: MapMode
    var side: Side
    
    init (map: Map, mode: MapMode, side: Side) {
        self.map = map
        self.mode = mode
        self.side = side
    }
}
