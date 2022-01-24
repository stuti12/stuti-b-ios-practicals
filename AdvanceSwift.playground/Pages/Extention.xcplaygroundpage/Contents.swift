//: [Previous](@previous)

import Foundation

//: [Previous](@previous)

import Foundation

extension String {
  //1 add character at index
    func addCharacter(char: Character) -> String {

            var new = Array(self)

            new.insert(char, at: 4)
            return String(new)
        }
//2 replace one character
    func replaceCharAtSpecificIndex(index: Int, newChar: Character) -> String {
        print()
        print("2 Replace character")
        var charOfString = [Character](self)
        
        charOfString[index - 1] = newChar
        return String(charOfString)

    }
//3 remove white space
    func removeWhiteSpaces() -> String {
        print()
        print("3 Remove white spaces")
        let charOfString = [Character](self)

        var finalString = ""
        for char in charOfString {
            if char != " " {
                finalString += String(char)
            }
        }
        return finalString
    }
    
//4
    func getNoOfWords() -> Int {
        print()
        print("4 Get no of words in given string")
            let stringArray = self.components(separatedBy: " ")
            return stringArray.count
        }
    
    }
var firstString = "Stut"
var secondString = "Remove white spaces from string"

var thirdString = "Get number of words in a string"
var ch : Character = "i"
print(firstString.addCharacter(char: ch))

print(firstString.replaceCharAtSpecificIndex(index: 3, newChar: "i"))
print(secondString.removeWhiteSpaces())

print(thirdString.getNoOfWords())

