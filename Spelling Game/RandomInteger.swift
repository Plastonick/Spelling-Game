//
//  RandomInteger.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-22.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

import Foundation

extension Int {
	
	static func random(in range: Range<Int>) -> Int {
		return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound)))
	}
	
}
