//
//  main.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-15.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

import Foundation

print("Loading dictionary...")

let words = try String(contentsOf: Bundle.main.url(forResource: "enable", withExtension: "txt")!, encoding: .utf8).components(separatedBy: "\n")

var dictionary = Letter()

for word in words {
	dictionary.add(word: word)
}

let players: [Player] = [
	HumanPlayer("Player 1"),
	DavidsComputerPlayer("Computer 1")
]

let game = Game(dictionary: dictionary, players: players)

game.play()
