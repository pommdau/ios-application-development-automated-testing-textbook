//
//  Chapter3_9_bTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import Foundation
import XCTest

protocol DateProtocol {
    func now() -> Date
}

// 実際のアプリで利用する本物のクラスの実装
class DateDefault: DateProtocol {
    func now() -> Date {
        return Date()
    }
}

// isHoliday()メソッドが定義されたクラスを定義
class CalendarUtil {
    
    let dateProtocol: DateProtocol
    
    // テスト時にコンストラクタでmockを渡す
    init(dateProtocol: DateProtocol = DateDefault()) {
        self.dateProtocol = dateProtocol
    }
    
    // MARK: - Functions
    
    func isHoliday() -> Bool {
        let now = dateProtocol.now()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: now)
        
        return weekday == 1 || weekday == 7
    }
    
}

struct MockDateProtocol: DateProtocol {
    
    // テストコードから設定し、その値がnow()で返される
    var date: Date? = nil
    
    func now() -> Date {
        return date!
    }
}

class CalendarUtilTests: XCTestCase {
    
    // MARK: - Tests
    
    func testIsHoliday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        var mock = MockDateProtocol()  // テストように渡すモックを作成
        
        // 日曜日
        mock.date = formatter.date(from: "2019/01/06")
        XCTAssertTrue(CalendarUtil.init(dateProtocol: mock).isHoliday())
        
        // 月曜日
        mock.date = formatter.date(from: "2019/01/07")
        XCTAssertFalse(CalendarUtil.init(dateProtocol: mock).isHoliday())
        
        // 金曜日
        mock.date = formatter.date(from: "2019/01/11")
        XCTAssertFalse(CalendarUtil.init(dateProtocol: mock).isHoliday())
        
        // 土曜日
        mock.date = formatter.date(from: "2019/01/12")
        XCTAssertTrue(CalendarUtil.init(dateProtocol: mock).isHoliday())
        
    }
    
}

