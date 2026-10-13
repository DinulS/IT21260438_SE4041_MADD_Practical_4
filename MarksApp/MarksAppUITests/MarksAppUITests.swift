import XCTest

// Covers the practical's test cases and captures the submission screenshots.
// Each case launches a fresh app because rejected input stays in the text fields.
final class MarksAppUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    private func launch() {
        app = XCUIApplication()
        app.launch()
    }

    @MainActor
    private func addStudent(name: String, mark: String) {
        if !name.isEmpty {
            let nameField = app.textFields["nameField"]
            nameField.tap()
            nameField.typeText(name)
        }

        let markField = app.textFields["markField"]
        markField.tap()
        markField.typeText(mark)

        app.buttons["addStudentButton"].tap()
    }

    @MainActor
    private func passedCount() -> String {
        app.staticTexts["passedCount"].label
    }

    @MainActor
    private func saveScreenshot(named name: String) {
        let attachment = XCTAttachment(screenshot: XCUIScreen.main.screenshot())
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }

    // Tests 1, 2, 6, 7 - valid and failing students, navigation, passed count
    @MainActor
    func testStudentListAndDetails() {
        launch()

        addStudent(name: "Amal", mark: "72")
        XCTAssertTrue(app.staticTexts["Amal"].waitForExistence(timeout: 5))
        XCTAssertEqual(passedCount(), "Passed Students: 1")

        addStudent(name: "Nimali", mark: "45")
        XCTAssertEqual(passedCount(), "Passed Students: 1") // failing student does not count

        addStudent(name: "Ruwan", mark: "58")
        addStudent(name: "Sanduni", mark: "90")
        addStudent(name: "Kasun", mark: "38")
        XCTAssertEqual(passedCount(), "Passed Students: 3")

        saveScreenshot(named: "01-Student-List")

        app.staticTexts["Amal"].tap()
        XCTAssertTrue(app.navigationBars["Student Details"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts["Mark: 72"].exists)
        XCTAssertTrue(app.staticTexts["Grade: B+"].exists)

        saveScreenshot(named: "02-Student-Details")

        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(app.navigationBars["SE4041 Marks"].waitForExistence(timeout: 5))

        app.staticTexts["Nimali"].tap()
        XCTAssertTrue(app.staticTexts["Mark: 45"].waitForExistence(timeout: 5))
    }

    // Test 3 - Empty Name
    @MainActor
    func testEmptyNameIsRejected() {
        launch()

        addStudent(name: "", mark: "60")

        XCTAssertTrue(app.staticTexts["Enter a student name."].waitForExistence(timeout: 5))
        XCTAssertEqual(passedCount(), "Passed Students: 0")
        XCTAssertFalse(app.staticTexts["60"].exists)
    }

    // Test 5 - Mark Above 100
    @MainActor
    func testMarkAbove100IsRejected() {
        launch()

        addStudent(name: "Ruwan", mark: "120")

        XCTAssertTrue(app.staticTexts["Mark must be between 0 and 100."].waitForExistence(timeout: 5))
        XCTAssertFalse(app.staticTexts["Ruwan"].exists)
    }

    // Test 8 - Boundary Marks: all accepted, only 50 and 100 pass
    @MainActor
    func testBoundaryMarks() {
        launch()

        addStudent(name: "Zero", mark: "0")
        addStudent(name: "FortyNine", mark: "49")
        addStudent(name: "Fifty", mark: "50")
        addStudent(name: "Hundred", mark: "100")

        for name in ["Zero", "FortyNine", "Fifty", "Hundred"] {
            XCTAssertTrue(app.staticTexts[name].waitForExistence(timeout: 5), "\(name) was not added")
        }
        XCTAssertEqual(passedCount(), "Passed Students: 2")
    }
}
