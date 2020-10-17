import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(OverAssistantTests.allTests),
        textCase(SynergyClassTests.allTests)
    ]
}
#endif
