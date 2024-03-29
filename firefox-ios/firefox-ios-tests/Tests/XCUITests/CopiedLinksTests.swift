// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import XCTest

class CopiedLinksTests: BaseTestCase {
    // This test is enable Offer to open copied links, when opening firefox
    func testCopiedLinks() {
        navigator.nowAt(NewTabScreen)
        navigator.goto(SettingsScreen)

        // Check Offer to open copied links, when opening firefox is off
        let value = app.tables.cells.switches["Offer to Open Copied Links, When Opening Firefox"].value
        XCTAssertEqual(value as? String, "0")

        // Switch on, Offer to open copied links, when opening firefox
        app.tables.cells.switches["Offer to Open Copied Links, When Opening Firefox"].tap()

        // Check Offer to open copied links, when opening firefox is on
        let value2 = app.tables.cells.switches["Offer to Open Copied Links, When Opening Firefox"].value
        XCTAssertEqual(value2 as? String, "1")

        app.navigationBars["Settings"].buttons["Done"].tap()

        app.buttons[AccessibilityIdentifiers.Toolbar.settingsMenuButton].tap()
        let settingsmenuitemCell = app.tables.otherElements["Settings"]
        settingsmenuitemCell.tap()

        // Check Offer to open copied links, when opening firefox is on
        let value3 = app.tables.cells.switches["Offer to Open Copied Links, When Opening Firefox"].value
        XCTAssertEqual(value3 as? String, "1")
    }
}
