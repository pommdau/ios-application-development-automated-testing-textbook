//
//  ExceptionTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1



class AssertThrowTests: XCTestCase {
        
    // MARK: - Download Helpers

    enum DownloadError: Error, Equatable {
        case connectionError
        case unknownError(code: Int)
    }
    
    func downloadContent(connectionFailed: Bool = false,
                         unknownError: Bool = false) throws {
        if connectionFailed {
            throw DownloadError.connectionError
        }
        
        if unknownError {
            throw DownloadError.unknownError(code: 9)
        }
    }
    
    // MARK: - Download Tests
    
    func testDownloadErrorThrowsError() {

        // XCTAssertThrowsErrorの引数はスローされた例外
        
        
        XCTAssertThrowsError(try downloadContent(connectionFailed: true, unknownError: false)) { (error: Error) -> Void in
            // 指定した例外エラーが発生しているかの確認
            XCTAssertEqual(error as? DownloadError, DownloadError.connectionError)
        }
        
        XCTAssertThrowsError(try downloadContent(connectionFailed: false, unknownError: true)) { (error: Error) -> Void in
            // 指定した例外エラーが発生しているかの確認
            XCTAssertEqual(error as? DownloadError, DownloadError.unknownError(code: 9))
        }
        
        XCTAssertThrowsError(try downloadContent(connectionFailed: false, unknownError: true)) { (error: Error) -> Void in
            // 指定した例外エラーが発生しているかの確認
            // + エラーの詳細の確認
            guard let downloadError = error as? DownloadError else {
                XCTFail()
                return
            }
            
            // switchを用いないAssociated Valueの取り出し方
            // [Switch\-less extraction of enum associated values in Swift            ](https://medium.com/@marioboikov/switch-less-extraction-of-enum-associated-values-in-swift-58910b46cacd)
            guard case .unknownError(let code) = downloadError else {
                XCTFail()
                return
            }
            
            XCTAssertEqual(code, 9)
        }

    }
    
    // MARK: - SystemError Helpers
    
    struct SystemError: Error {
        let message: String
    }
    
    func throwSystemError() throws {
        throw SystemError(message: "memory access error")
    }
    
    func testSystemErrorThrowsError() {
        XCTAssertThrowsError(try throwSystemError()) { (error: Error) -> Void in
            
            // SystemErrorにキャストできることの検証
            guard let systemError = error as? SystemError else {
                XCTFail()
                return
            }
            
            // messageプロパティの検証
            XCTAssertEqual(systemError.message, "memory access error")
            
        }
    }
    
    
}
