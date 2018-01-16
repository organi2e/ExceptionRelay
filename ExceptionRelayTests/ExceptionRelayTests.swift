//
//  ExceptionRelayTests.swift
//  ExceptionRelayTests
//
//  Created by Kota Nakano on 2017/05/12.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//

import XCTest
import ExceptionRelay

class ExceptionRelayTests: XCTestCase {
	func testRaise() {
		do {
			try exceptionable {
				NSException(name: .invalidArgumentException, reason: "a reason", userInfo: nil).raise()
			}
			XCTFail()
		} catch let error as NSError {
			XCTAssert(NSExceptionName(error.domain) == .invalidArgumentException)
		}
	}
	func testArray() {
		do {
			try exceptionable {
				NSArray().object(at: 0)
			}
			XCTFail()
		} catch let error as NSError {
			XCTAssert(NSExceptionName(error.domain) == .rangeException)
		}
	}
}

