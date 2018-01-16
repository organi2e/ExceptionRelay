//
//  ExceptionRelay.swift
//  ExceptionRelay
//
//  Created by Kota Nakano on 2017/05/12.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//

import Foundation
@objc private protocol ExceptionRelay {
	func relayException(try: () -> ()) throws
}
public func exceptionable(block: ()->()) throws {
	guard let Class: AnyClass = NSClassFromString("ExceptionRelay") else {
		throw NSError(domain: "ObjectiveC Runtime Error", code: -1, userInfo: nil)
	}
	try(Class as AnyObject).relayException(try: block)
}

