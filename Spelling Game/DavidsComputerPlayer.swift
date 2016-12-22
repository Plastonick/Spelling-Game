//
//  DavidsComputerPlayer.swift
//  Spelling Game
//
//  Created by David Pugh on 22/12/2016.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

import Foundation

final class DavidsComputerPlayer: Player {
	
	let name: String
	
	init(_ name: String) {
		self.name = name
	}
	
	func selectLetter(currentWord: String, dictionary: Letter) -> Character? {
		fatalError("Not implemented")
	}
	
	func respondToChallenge(currentWord: String, dictionary: Letter) -> String? {
		fatalError("Not implemented")
	}
	
}
