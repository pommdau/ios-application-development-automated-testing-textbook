//
//  Chapter3_9Tests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import XCTest
@testable import Chapter3_1

class Chapter3_9Tests: XCTestCase {
    
    // MARK: - Helpers
    
    func isHoliday(_ date: Date = Date()) -> Bool {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: date)
        
        return weekday == 1 || weekday == 7
    }

    // MARK: - Tests
    
    func testIsHolidayGood() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        var testDate: Date!
        
        // 日曜日
        testDate = formatter.date(from: "2019/01/06")
        XCTAssertTrue(isHoliday(testDate))
        
        // 月曜日
        testDate = formatter.date(from: "2019/01/07")
        XCTAssertFalse(isHoliday(testDate))
        
        // 金曜日
        testDate = formatter.date(from: "2019/01/11")
        XCTAssertFalse(isHoliday(testDate))
        
        // 土曜日
        testDate = formatter.date(from: "2019/01/12")
        XCTAssertTrue(isHoliday(testDate))
        
    }
    
    
}
