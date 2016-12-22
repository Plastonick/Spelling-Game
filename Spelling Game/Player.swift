//
//  Player.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-21.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

protocol Player {
	
	var name: String { get }
	
	func selectLetter(currentWord: String, dictionary: Letter) -> Character?
	
	func respondToChallenge(currentWord: String, dictionary: Letter) -> String?
	
}
