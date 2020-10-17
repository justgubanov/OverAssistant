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

extension HeroId: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral heroNumber: IntegerLiteralType) {
        let listValue = HeroIdList.allCases.first {
            $0.rawValue.number == heroNumber
        }
        
        guard let listedHero = listValue else {
            idString = ""
            number = heroNumber
            return
        }
        self = listedHero.rawValue
    }
}

extension HeroId: ExpressibleByStringLiteral {
    
    public init(stringLiteral heroIdString: StringLiteralType) {
        let listValue = HeroIdList.allCases.first {
            $0.rawValue.idString == heroIdString
        }
        
        guard let listedHero = listValue else {
            idString = heroIdString
            number = 0
            return
        }
        self = listedHero.rawValue
    }
}
