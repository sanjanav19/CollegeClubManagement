import XCTest

final class CollegeClubManagementUITests: XCTestCase {

    func testStudentFlow() {
        let app = XCUIApplication()
        app.launch()

        let email = app.textFields["emailField"]
        let password = app.secureTextFields["passwordField"]
        let loginButton = app.buttons["loginButton"]

        email.tap()
        email.typeText("student@campus.com")

        password.tap()
        password.typeText("123456")

        loginButton.tap()

        sleep(3)

        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Student Dashboard"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}