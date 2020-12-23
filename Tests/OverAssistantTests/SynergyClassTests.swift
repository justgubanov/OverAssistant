import XCTest
@testable import OverAssistant

final class SynergyOptionTests: XCTestCase {
    
    static var allTests = [
        ("testEquitability_exactlyTheSame", testEquitability_exactlyTheSame),
        ("testEquitability_different", testEquitability_different),
        ("testEquitability_differentStrength", testEquitability_differentStrength),
    ]
 
    func testEquitability_exactlyTheSame() {
        let firstSynergy: SynergyOption = .abilityBased(strength: .best)
        let sameSynergy: SynergyOption = .abilityBased(strength: .best)
        
        XCTAssertEqual(firstSynergy, sameSynergy, "Two instance of same type with same strength should be equal")
    }
    
    func testEquitability_different() {
        let firstSynergy: SynergyOption = .playStyleBased(strength: .best)
        let sameSynergy: SynergyOption = .abilityBased(strength: .best)
        
        XCTAssertNotEqual(firstSynergy, sameSynergy, "Two instance of same type with different strength should NOT be equal")
    }
    
    func testEquitability_differentStrength() {
        let firstSynergy: SynergyOption = .abilityBased(strength: .good)
        let sameSynergy: SynergyOption = .abilityBased(strength: .best)
        
        XCTAssertNotEqual(firstSynergy, sameSynergy, "Two instance of same type with different strength should NOT be equal")
    }
}
