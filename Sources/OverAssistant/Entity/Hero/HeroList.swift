//
//  HeroList.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 24/07/2019.
//

public enum HeroList {
    
    public static let list = [
        tracer :
            Hero(name: "Tracer", number: 1,
                 abilities: [Ability(name: "Pulse Bomb", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Pulse Pistols", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 150),
        reaper :
            Hero(name: "Reaper", number: 2,
                 abilities: [Ability(name: "Death Blossom", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Hellfire Shotguns", range: .close)],
                 role: .damage, playstyle: .flanker, health: 250),
        widowmaker :
            Hero(name: "Widowmaker", number: 3,
                 abilities: [Ability(name: "Infra-Sight", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Widow's Kiss", range: .long)],
                 role: .damage, playstyle: .sniper, health: 200),
        pharah :
            Hero(name: "Pharah", number: 4,
                 abilities: [Ability(name: "Barrage", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Rocket Launcher", range: .medium)],
                 role: .damage, playstyle: .assault, health: 200),
        reinhardt :
            Hero(name: "Reinhardt", number: 5,
                 abilities: [Ability(name: "Earthshatter", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Rocket Hammer", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(300, armour: 200)),
        
        
        mercy :
            Hero(name: "Mercy", number: 6,
                 abilities: [Ability(name: "Valkyrie", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Caduceus Staff", range: .medium),
                           Weapon(name: "Caduceus Blaster", range: .medium)],
                 role: .support, playstyle: .healer, health: 200),
        torbjorn :
            Hero(name: "Torbjörn", number: 7,
                 abilities: [Ability(name: "Molten Core", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Rivet Gun", range: .medium),
                           Weapon(name: "Forge Hammer", range: .close)],
                 role: .damage, playstyle: .choker, health: .init(200, armour: 50)),
        hanzo :
            Hero(name: "Hanzo", number: 8,
                 abilities: [Ability(name: "Dragonstrike", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Storm Bow", range: .long)],
                 role: .damage, playstyle: .sniper, health: 200),
        winston :
            Hero(name: "Winston", number: 9,
                 abilities: [Ability(name: "Primal Rage", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Tesla Cannon", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(400, armour: 100)),
        zenyatta :
            Hero(name: "Zenyatta", number: 10,
                 abilities: [Ability(name: "Transcendence", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Orb of Destruction", range: .medium)],
                 role: .support, playstyle: .healer, health: .init(50, shield: 150)),
        
        
        bastion :
            Hero(name: "Bastion", number: 11,
                 abilities: [Ability(name: "Configuration: Tank", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Configuration: Recon", range: .medium),
                           Weapon(name: "Configuration: Sentry", range: .medium),
                           Weapon(name: "Configuration: Tank", range: .medium)],
                 role: .damage, playstyle: .choker, health: .init(200, armour: 100)),
        symmetra :
            Hero(name: "Symmetra", number: 12,
                 abilities: [Ability(name: "Photon Barrier", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Photon Projector", range: .close)],
                 role: .damage, playstyle: .choker, health: .init(100, shield: 100)),
        zarya :
            Hero(name: "Zarya", number: 13,
                 abilities: [Ability(name: "Graviton Surge", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Particle Cannon", range: .long)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(200, shield: 200)),
        mccree :
            Hero(name: "McCree", number: 14,
                 abilities: [Ability(name: "Deadeye", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Peacekeeper", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
        soldier76 :
            Hero(name: "Soldier: 76", number: 15,
                 abilities: [Ability(name: "Tactical Visor", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Heavy Pulse Rifle", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
        
        
        lucio :
            Hero(name: "Lúcio", number: 16,
                 abilities: [Ability(name: "Sound Barrier", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Sonic Amplifier", range: .close)],
                 role: .support, playstyle: .healer, health: 200),
        roadhog :
            Hero(name: "Roadhog", number: 17,
                 abilities: [Ability(name: "Whole Hog", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Scrap Gun", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: 600),
        junkrat :
            Hero(name: "Junkrat", number: 18,
                 abilities: [Ability(name: "RIP-Tire", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Frag Launcher", range: .medium)],
                 role: .damage, playstyle: .choker, health: 200),
        dva :
            Hero(name: "D.Va", number: 19,
                 abilities: [Ability(name: "Self-Destruct", kind: .ultimate, tags: .offensive),
                             Ability(name: "Call Mech", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Fusion Cannons", range: .close),
                           Weapon(name: "Light Gun", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(400, armour: 200)),
        mei :
            Hero(name: "Mei", number: 20,
                 abilities: [Ability(name: "Blizzard", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Endothermic Blaster", range: .medium)],
                 role: .damage, playstyle: .assault, health: 250),
        
        
        genji :
            Hero(name: "Genji", number: 21,
                 abilities: [Ability(name: "Dragonblade", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Shuriken", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 200),
        ana :
            Hero(name: "Ana", number: 22,
                 abilities: [Ability(name: "Nano Boost", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Biotic Rifle", range: .long)],
                 role: .support, playstyle: .healer, health: 200),
        sombra :
            Hero(name: "Sombra", number: 23,
                 abilities: [Ability(name: "EMP", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Machine Pistol", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 200),
        orisa :
            Hero(name: "Orisa", number: 24,
                 abilities: [Ability(name: "Supercharger", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Fusion Driver", range: .medium)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(200, armour: 250)),
        doomfist :
            Hero(name: "Doomfist", number: 25,
                 abilities: [Ability(name: "Meteor strike", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Hand Cannon", range: .close)],
                 role: .damage, playstyle: .flanker, health: 250),
        
        
        moira :
            Hero(name: "Moira", number: 26,
                 abilities: [Ability(name: "Coalescence", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Biotic Grasp", range: .close)],
                 role: .support, playstyle: .healer, health: 200),
        brigitte :
            Hero(name: "Brigitte", number: 27,
                 abilities: [Ability(name: "Rally", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Rocket Flail", range: .close)],
                 role: .support, playstyle: .healer, health: .init(150, armour: 50)),
        wreckingball :
            Hero(name: "Wrecking Ball", number: 28,
                 abilities: [Ability(name: "Minefield", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Quad Cannons", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(500, armour: 100)),
        ashe :
            Hero(name: "Ashe", number: 29,
                 abilities: [Ability(name: "B.O.B.", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "The Viper", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
        baptiste :
            Hero(name: "Baptiste", number: 30,
                 abilities: [Ability(name: "Amplification Matrix", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Biotic Launcher", range: .medium)],
                 role: .support, playstyle: .healer, health: 200),
        
        
        sigma :
            Hero(name: "Sigma", number: 31,
                 abilities: [Ability(name: "Gravitic Flux", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Hyperspheres", range: .medium),
                           Weapon(name: "Accretion", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(300, shield: 100)),
        echo :
            Hero(name: "Echo", number: 32,
                 abilities: [Ability(name: "Duplicate", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Tri-Shot", range: .medium),
                           Weapon(name: "Sticky Bombs", range: .medium),
                           Weapon(name: "Focusing Beam", range: .close)],
                 role: .damage, playstyle: .assault, health: 200)
    ]
    
    case tracer, reaper, widowmaker, pharah, reinhardt
    case mercy, torbjorn, hanzo, winston, zenyatta
    case bastion, symmetra, zarya, mccree, soldier76
    case lucio, roadhog, junkrat, dva, mei
    case genji, ana, sombra, orisa, doomfist
    case moira, brigitte, wreckingball, ashe, baptiste
    case sigma, echo
    
    public static subscript(hero: HeroList) -> Hero {
        return HeroList.list[hero]!
    }
    
    public static subscript(heroNumber number: Int) -> Hero? {
        let numbersRange = 1...list.count
        
        guard numbersRange.contains(number) else {
            return nil
        }
        let match = list.filter { $1.number == number }
        let requestedHero = match.first?.value
        return requestedHero
    }
    
    public static func getHeroes(role: Hero.Role) -> [Hero] {
        return list.filter {
            $0.value.role == role
        }
        .map { $1 }
    }
}
