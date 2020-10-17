//
//  HeroIdList.swift
//  
//
//  Created by Александр Губанов on 17.10.2020.
//

public enum HeroIdList: RawRepresentable, CaseIterable {
    
    public typealias RawValue = HeroId
    
    case tracer, reaper, widowmaker, pharah, reinhardt
    case mercy, torbjorn, hanzo, winston, zenyatta
    case bastion, symmetra, zarya, mccree, soldier76
    case lucio, roadhog, junkrat, dva, mei
    case genji, ana, sombra, orisa, doomfist
    case moira, brigitte, wreckingBall, ashe, baptiste
    case sigma, echo
    
    public var rawValue: HeroId {
        switch self {
        case .tracer:
            return HeroId(idString: "tracer", number: 1)
        case .reaper:
            return HeroId(idString: "reaper", number: 2)
        case .widowmaker:
            return HeroId(idString: "widowmaker", number: 3)
        case .pharah:
            return HeroId(idString: "pharah", number: 4)
        case .reinhardt:
            return HeroId(idString: "reinhardt", number: 5)
        case .mercy:
            return HeroId(idString: "mercy", number: 6)
        case .torbjorn:
            return HeroId(idString: "torbjorn", number: 7)
        case .hanzo:
            return HeroId(idString: "hanzo", number: 8)
        case .winston:
            return HeroId(idString: "winston", number: 9)
        case .zenyatta:
            return HeroId(idString: "zenyatta", number: 10)
        
        case .bastion:
            return HeroId(idString: "bastion", number: 11)
        case .symmetra:
            return HeroId(idString: "symmetra", number: 12)
        case .zarya:
            return HeroId(idString: "zarya", number: 13)
        case .mccree:
            return HeroId(idString: "mccree", number: 14)
        case .soldier76:
            return HeroId(idString: "soldier76", number: 15)
        case .lucio:
            return HeroId(idString: "lucio", number: 16)
        case .roadhog:
            return HeroId(idString: "roadhog", number: 17)
        case .junkrat:
            return HeroId(idString: "junkrat", number: 18)
        case .dva:
            return HeroId(idString: "dva", number: 19)
        case .mei:
            return HeroId(idString: "mei", number: 20)
        
        case .genji:
            return HeroId(idString: "genji", number: 21)
        case .ana:
            return HeroId(idString: "ana", number: 22)
        case .sombra:
            return HeroId(idString: "sombra", number: 23)
        case .orisa:
            return HeroId(idString: "orisa", number: 24)
        case .doomfist:
            return HeroId(idString: "doomfist", number: 25)
        case .moira:
            return HeroId(idString: "moira", number: 26)
        case .brigitte:
            return HeroId(idString: "brigitte", number: 27)
        case .wreckingBall:
            return HeroId(idString: "wreckingBall", number: 28)
        case .ashe:
            return HeroId(idString: "ashe", number: 29)
        case .baptiste:
            return HeroId(idString: "baptiste", number: 30)
        
        case .sigma:
            return HeroId(idString: "sigma", number: 31)
        case .echo:
            return HeroId(idString: "echo", number: 32)
        }
    }
    
    public init?(rawValue: HeroId) {
        switch (rawValue.idString, rawValue.number) {
        case ("tracer", 1):
            self = .tracer
        case ("reaper", 2):
            self = .reaper
        case ("widowmaker", 3):
            self = .widowmaker
        case ("pharah", 4):
            self = .pharah
        case ("reinhardt", 5):
            self = .reinhardt
        case ("mercy", 6):
            self = .mercy
        case ("torbjorn", 7):
            self = .torbjorn
        case ("hanzo", 8):
            self = .hanzo
        case ("winston", 9):
            self = .winston
        case ("zenyatta", 10):
            self = .zenyatta
            
        case ("bastion", 11):
            self = .bastion
        case ("symmetra", 12):
            self = .symmetra
        case ("zarya", 13):
            self = .zarya
        case ("mccree", 14):
            self = .mccree
        case ("soldier76", 15):
            self = .soldier76
        case ("lucio", 16):
            self = .lucio
        case ("roadhog", 17):
            self = .roadhog
        case ("junkrat", 18):
            self = .junkrat
        case ("dva", 19):
            self = .dva
        case ("mei", 20):
            self = .mei
            
        case ("genji", 21):
            self = .genji
        case ("ana", 22):
            self = .ana
        case ("sombra", 23):
            self = .sombra
        case ("orisa", 24):
            self = .orisa
        case ("doomfist", 25):
            self = .doomfist
        case ("moira", 26):
            self = .moira
        case ("brigitte", 27):
            self = .brigitte
        case ("wreckingBall", 28):
            self = .wreckingBall
        case ("ashe", 29):
            self = .ashe
        case ("baptiste", 30):
            self = .baptiste
            
        case ("sigma", 31):
            self = .sigma
        case ("echo", 32):
            self = .echo
        default:
            return nil
        }
    }
}
