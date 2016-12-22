//
//  Letter.swift
//  Spelling Game
//
//  Created by Robert Pugh on 2016-12-15.
//  Copyright © 2016 Robert Pugh. All rights reserved.
//

struct Letter: CustomStringConvertible {
	
	var characters = [Character:Letter]()
	
	var isCompleteWord = false
	
	init() {
		
	}
	
	mutating func add(word: String) {
		var iterator = word.characters.makeIterator()
		
		add(characterIterator: &iterator)
	}
	
	private mutating func add<T: IteratorProtocol>(characterIterator iterator: inout T) where T.Element == Character {
		if let nextCharacter = iterator.next() {
			if characters[nextCharacter] == nil {
				characters[nextCharacter] = Letter()
			}
			
			characters[nextCharacter]?.add(characterIterator: &iterator)
		} else {
			isCompleteWord = true
		}
	}
	
	func letterForWord(_ word: String) -> Letter? {
		var iterator = word.characters.makeIterator()
		
		return letterForCharacterIterator(&iterator)
	}
	
	private func letterForCharacterIterator<T: IteratorProtocol>(_ iterator: inout T) -> Letter? where T.Element == Character {
		if let nextCharacter = iterator.next() {
			if let nextLetter = characters[nextCharacter] {
				return nextLetter.letterForCharacterIterator(&iterator)
			} else {
				return nil
			}
		} else {
			return self
		}
	}
	
	var description: String {
		func indent(_ string: String) -> String {
			return string.replacingOccurrences(of: "\n", with: "\n\t")
		}
		
		return characters.map({ (character, letter) -> String in
			return "\(character)\(letter.isCompleteWord ? "*" : "")\n\t\(indent(letter.description))"
		}).joined(separator: "\n")
	}
	
}
