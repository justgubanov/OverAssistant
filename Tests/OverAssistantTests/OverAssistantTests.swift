import XCTest
@testable import OverAssistant

final class OverAssistantTests: XCTestCase {
    
    func testSelectorWithProfile() {
        ProfileProvider().loadProfile(nickname: "Xogsnim", platform: .psn)
        sleep(10)
        
        guard let xogsnimProfile = ProfileStorage["Xogsnim"] else {
            XCTFail()
            return
        }
        var helper = PickHelper()
        helper.playerProfile = xogsnimProfile
        helper.conditions = GameConditions(map: nil, offenseSide: .symmetrical)
        helper.typeOfQueue = .roleSpecific(.tank)
        
        helper.enemies = [HeroList[.tracer],
                          HeroList[.mercy],
                          HeroList[.winston],
                          HeroList[.junkrat]]
        
        helper.allies = [HeroList[.soldier76],
                         HeroList[.roadhog],
                         HeroList[.dva]]
        
        let pickOptions = helper.getScoredHeroes()
        let sortedByScore = pickOptions.sorted { firstPick, secondPick in
            firstPick.value.value > secondPick.value.value
        }
        let topFive = sortedByScore.prefix(5)
        for (hero, score) in topFive {
            print(hero.name, score.value, score.sequence[.dps] ?? 0)
        }
        
        print(HeroList.getHeroes(role: .support).map {$0.name} )
    }
    
    func testSelectorWOProfile() {
        var helper = PickHelper()
        helper.conditions = GameConditions(map: nil, offenseSide: .symmetrical)
        helper.typeOfQueue = .roleSpecific(.tank)
        
        helper.enemies = [HeroList[.tracer],
                          HeroList[.mercy],
                          HeroList[.winston],
                          HeroList[.junkrat]]
        
        helper.allies = [HeroList[.soldier76],
                         HeroList[.roadhog],
                         HeroList[.dva]]
        
        let pickOptions = helper.getScoredHeroes()
        let sortedByScore = pickOptions.sorted { firstPick, secondPick in
            firstPick.value.value > secondPick.value.value
        }
        let topFive = sortedByScore.prefix(5)
        for (hero, score) in topFive {
            print(hero.name, score.value, score.sequence[.dps] ?? 0)
        }
        
        print(HeroList.getHeroes(role: .support).map {$0.name} )
    }
    
    static var allTests = [
        ("testSelectorWithProfile", testSelectorWithProfile),
        ("testSelectorWOProfile", testSelectorWOProfile),
    ]
}
