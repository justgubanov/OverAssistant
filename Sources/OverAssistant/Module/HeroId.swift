//
//  HeroId.swift
//  
//
//  Created by Александр Губанов on 17.10.2020.
//

public struct HeroId {
    
    public var idString: String
    public var number: Int
}

extension HeroId: Equatable, Hashable {}

extension HeroId: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral heroNumber: IntegerLiteralType) {
        let listValue = Self.allCases.first {
            $0.number == heroNumber
        }
        
        guard let listedHero = listValue else {
            idString = ""
            number = heroNumber
            return
        }
        self = listedHero
    }
}

extension HeroId: ExpressibleByStringLiteral {
    
    public init(stringLiteral heroIdString: StringLiteralType) {
        let listValue = Self.allCases.first {
            $0.idString == heroIdString
        }
        
        guard let listedHero = listValue else {
            idString = heroIdString
            number = 0
            return
        }
        self = listedHero
    }
}

extension HeroId {
    
    public static let tracer = HeroId(idString: "tracer", number: 1)
    public static let reaper = HeroId(idString: "reaper", number: 2)
    public static let widowmaker = HeroId(idString: "widowmaker", number: 3)
    public static let pharah = HeroId(idString: "pharah", number: 4)
    public static let reinhardt = HeroId(idString: "reinhardt", number: 5)
    public static let mercy = HeroId(idString: "mercy", number: 6)
    public static let torbjorn = HeroId(idString: "torbjorn", number: 7)
    public static let hanzo = HeroId(idString: "hanzo", number: 8)
    public static let winston = HeroId(idString: "winston", number: 9)
    public static let zenyatta = HeroId(idString: "zenyatta", number: 10)
    
    public static let bastion = HeroId(idString: "bastion", number: 11)
    public static let symmetra = HeroId(idString: "symmetra", number: 12)
    public static let zarya = HeroId(idString: "zarya", number: 13)
    public static let mccree = HeroId(idString: "mccree", number: 14)
    public static let soldier76 = HeroId(idString: "soldier76", number: 15)
    public static let lucio = HeroId(idString: "lucio", number: 16)
    public static let roadhog = HeroId(idString: "roadhog", number: 17)
    public static let junkrat = HeroId(idString: "junkrat", number: 18)
    public static let dva = HeroId(idString: "dva", number: 19)
    public static let mei = HeroId(idString: "mei", number: 20)
    
    public static let genji = HeroId(idString: "genji", number: 21)
    public static let ana = HeroId(idString: "ana", number: 22)
    public static let sombra = HeroId(idString: "sombra", number: 23)
    public static let orisa = HeroId(idString: "orisa", number: 24)
    public static let doomfist = HeroId(idString: "doomfist", number: 25)
    public static let moira = HeroId(idString: "moira", number: 26)
    public static let brigitte = HeroId(idString: "brigitte", number: 27)
    public static let wreckingBall = HeroId(idString: "wreckingBall", number: 28)
    public static let ashe = HeroId(idString: "ashe", number: 29)
    public static let baptiste = HeroId(idString: "baptiste", number: 30)
    
    public static let sigma = HeroId(idString: "sigma", number: 31)
    public static let echo = HeroId(idString: "echo", number: 32)
    
    public static var allCases: [HeroId] = [
        tracer, reaper, widowmaker, pharah, reinhardt,
        mercy, torbjorn, hanzo, winston, zenyatta,
        bastion, symmetra, zarya, mccree, soldier76,
        lucio, roadhog, junkrat, dva, mei,
        genji, ana, sombra, orisa, doomfist,
        moira, brigitte, wreckingBall, ashe, baptiste,
        sigma, echo,
    ]
}
