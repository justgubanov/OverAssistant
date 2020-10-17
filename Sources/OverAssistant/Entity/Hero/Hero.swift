//
//  Hero.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

var counterMatrix: [[Int]] = [
    //horisontally: who is countering
    //vertically: who is being countered
    [0,0,0,0,0, 0,0,2,0,2, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,2, 0,0,0,2,2, 0,0,1,0,0, 0,2,0,1,0, 0,0,1,1,0, 0,0,1,0,0, 0,0],
    [0,0,0,2,0, 0,2,1,0,0, 1,0,0,1,0, 0,0,2,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [1,2,0,0,2, 0,0,0,0,0, 0,2,2,0,0, 0,0,2,0,1, 1,0,0,0,2, 0,2,0,0,0, 0,0],
    [0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],

    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,1,1,0, 0,0,0,0,0, 0,0],
    [0,0,1,0,0, 0,0,0,0,2, 0,2,0,1,0, 0,0,0,0,0, 2,1,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],

    [0,0,0,0,2, 0,0,0,2,0, 0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,2,0,0,0, 0,0,0,0,0, 0,1,1,2,1, 2,0,0,0,0, 0,0,0,0,0, 0,0],
    [2,0,0,2,0, 1,0,0,0,0, 0,1,0,0,0, 2,0,0,0,0, 0,0,1,0,1, 0,0,0,0,0, 0,0],
    [0,0,0,1,0, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0],

    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,2,0, 1,0,0,1,1, 1,0,0,0,0, 0,0,1,0,0, 0,0,1,0,0, 0,0],
    [1,1,0,0,2, 0,2,0,0,0, 1,0,0,0,0, 0,0,0,1,0, 0,0,1,0,0, 0,1,0,0,0, 0,0],
    [0,0,2,1,0, 2,0,2,0,0, 1,0,0,1,0, 0,0,0,0,0, 0,0,0,0,0, 1,0,0,0,0, 0,0],
    [0,0,0,0,2, 0,0,0,0,0, 0,0,0,1,0, 0,2,0,1,0, 0,0,0,0,0, 0,0,1,0,0, 0,0],

    [0,0,2,0,0, 2,0,2,0,0, 1,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 0,0,0,0,0, 0,0],
    [0,0,0,1,0, 0,1,0,0,1, 1,0,0,0,0, 1,0,0,0,0, 0,0,0,0,0, 1,0,1,0,0, 0,0],
    [2,0,0,0,1, 0,0,0,0,1, 0,1,0,0,0, 1,0,0,1,0, 0,0,0,0,2, 0,1,2,0,0, 0,0],
    [0,0,1,0,0, 0,1,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,0,0,0, 0,0],
    [0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 1,0,0,0,0, 0,0,0,0,0, 0,0],

    [0,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 0,0,0,0,0, 0,0],
    [1,0,0,0,1, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,1,0, 1,0,0,0,0, 0,0,2,0,0, 0,0],
    [0,0,1,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0],
    [0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0]
]

public class Hero {
    
    enum Playstyle: String {
        
        case flanker
        case assault
        case choker
        case healer
        case damageAbsorber
        case sniper
    }
    
    public enum Role: String {
        
        case tank
        case damage
        case support
    }
    
    var name: String
    var number: Int
    var role: Role
    var stats: HealthStats
    
    var playstyle: Playstyle
    var abilityList: [Ability]
    var weaponList: [Weapon]

    init (name: String, number: Int, abilities: [Ability], weapons: [Weapon], role: Role, playstyle: Playstyle, health: HealthStats) {
        self.name = name
        self.number = number
        self.role = role
        self.stats = health
        
        self.playstyle = playstyle
        self.abilityList = abilities
        self.weaponList = weapons
    }
    
    func getUltimateAbilityTags() -> Ability.TagSet {
        let selectedAbilities = abilityList.filter { ability in
            ability.kind == .ultimate
        }
        return selectedAbilities.reduce([]) { tags, ability in
            tags.union(ability.tags)
        }
    }

    func isEffective(at range: Weapon.Range) -> Bool {
        let ranges = weaponList.flatMap { $0.effectiveRange }
        return ranges.contains(range)
    }

    func synergises(with otherHero: Hero) -> Bool {
        let synergy = SynergyProvider.getSynergy(between: self, and: otherHero)
        
        guard synergy != .none else {
            return false
        }
        return true
    }

    func counters(_ otherHero: Hero) -> Bool {
        let firstIndex = self.number - 1
        let secondIndex = otherHero.number - 1
        
        guard firstIndex < counterMatrix.capacity,
              secondIndex < counterMatrix.capacity else {
            return false
        }
        return counterMatrix[firstIndex][secondIndex] != 0
    }
}

extension Hero: Hashable {
    
    public static func == (lhs: Hero, rhs: Hero) -> Bool {
        lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
