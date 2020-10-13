import XCTest
@testable import OverAssistant

final class OverAssistantTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(OverAssistant().text, "Hello, World!")
    }
    
    func testSelector() {
        ProfileProvider().loadProfile(nickname: "Xogsnim", platform: .psn)
        sleep(10)
        
        guard let xogsnimProfile = ProfileStorage["Xogsnim"] else {
            XCTFail()
            return
        }
        var helper = PickHelper(playerProfile: xogsnimProfile)
        helper.conditions = GameConditions(map: nil, offenseSide: .symmetrical)
        helper.typeOfQueue = .support
        
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
        ("testExample", testExample),
    ]
}
