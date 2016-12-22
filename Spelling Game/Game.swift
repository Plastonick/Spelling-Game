//
//  Game.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-21.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

final class Game {
	
	let players: [Player]
	var currentPlayerIndex: Array<Player>.Index
	
	var currentPlayer: Player {
		return players[currentPlayerIndex]
	}
	
	var previousPlayer: Player {
		if currentPlayerIndex == players.startIndex {
			return players[players.endIndex.advanced(by: -1)]
		} else {
			return players[currentPlayerIndex.advanced(by: -1)]
		}
	}
	
	var currentWord: String
	let dictionary: Letter
	
	var winner: Player?
	
	init(dictionary: Letter, players: [Player]) {
		self.players = players
		self.currentPlayerIndex = players.startIndex
		
		self.currentWord = ""
		self.dictionary = dictionary
	}
	
	func play() {
		print("Game begins!")
		
		repeat {
			print()
			
			playRound()
			
			currentPlayerIndex = currentPlayerIndex.advanced(by: 1)
			
			if currentPlayerIndex == players.endIndex {
				currentPlayerIndex = players.startIndex
			}
		} while winner == nil
		
		if let winner = winner {
			print("\(winner.name) wins!")
		}
	}
	
	private func playRound() {
		print("It’s \(currentPlayer.name)’s turn!")
		print("Current word: \(currentWord)")
		
		let nextCharacter = currentPlayer.selectLetter(currentWord: currentWord, dictionary: dictionary)
		
		if let character = nextCharacter {
			currentWord += String(character)
			
			if let letter = dictionary.letterForWord(currentWord), letter.isCompleteWord {
				print("\(currentPlayer.name) completed a word!")
				winner = previousPlayer
			}
		} else {
			print("\(currentPlayer.name) challenges \(previousPlayer.name)!")
			
			let response = previousPlayer.respondToChallenge(currentWord: currentWord, dictionary: dictionary)
			
			if let response = response, let letter = dictionary.letterForWord(currentWord + response), letter.isCompleteWord {
				winner = previousPlayer
			} else {
				winner = currentPlayer
			}
		}
	}
	
}
