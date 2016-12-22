//
//  HumanPlayer.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-21.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

import Foundation

final class HumanPlayer: Player {
	
	let name: String
	
	init(_ name: String) {
		self.name = name
	}
	
	func selectLetter(currentWord: String, dictionary: Letter) -> Character? {
		print("Enter next letter (or empty for challenge):", currentWord, terminator: "")
		
		return readLine(strippingNewline: true)?.characters.first ?? nil
	}
	
	func respondToChallenge(currentWord: String, dictionary: Letter) -> String? {
		print("Complete the word:", currentWord, terminator: "")
		
		return readLine(strippingNewline: true)
	}
	
}
