import XCTest

final class BerlinClockTests: XCTestCase {

    var clock: BerlinClockProtocol?

    let dateFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "HH:mm:ss"
        return result
    }()

    // MARK: - Seconds

    // Given I have started the converter
    // When I enter 00:00:00
    // Then Y is returned for the seconds lamp
    func testSecondsLampEven() throws {
        guard let date = dateFormatter.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSeconds(), Light.yellow)
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then O is returned for the seconds lamp
    func testSecondsLampOdd() throws {
        guard let date = dateFormatter.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSeconds(), Light.off)
    }

    // MARK: - Five hour row

    func testFiveHoursRowLength() throws {
        guard let date = dateFormatter.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow().count, 4)
    }

    // Given I have started the converter
    // When I enter 00:00:00
    // Then OOOO is returned for the seconds lamp
    func testFiveHoursRowAllOff() throws {
        guard let date = dateFormatter.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then RRRR is returned for the seconds lamp
    func testFiveHoursRowAllOn() throws {
        guard let date = dateFormatter.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.red, Light.red, Light.red])
    }

    // Given I have started the converter
    // When I enter 02:04:00
    // Then OOOO is returned for the seconds lamp
    func testFiveHoursRowNoLights() throws {
        guard let date = dateFormatter.date(from: "02:04:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 08:23:00
    // Then ROOO is returned for the seconds lamp
    func testFiveHoursRowSingleLightOn() throws {
        guard let date = dateFormatter.date(from: "08:23:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 16:35:00
    // Then RRRO is returned for the seconds lamp
    func testFiveHoursRowMultipleLightsOn() throws {
        guard let date = dateFormatter.date(from: "16:35:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.red, Light.red, Light.off])
    }

    
}
