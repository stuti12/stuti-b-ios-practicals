//: [Previous](@previous)

import Foundation

extension String {
  //1 add character at index
    func charAtFifthIndex() -> String {
        print("1 Add character at 5th position")
        let charOfString = [Character](self)
        return String(charOfString[4])
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

       // let arr : [Int]()
        let arr2 : [Int]
        let arr3 = [Int]()
        
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
var firstString = "Stutj"
var secondString = "Remove white spaces from string"

var thirdString = "Get number of words in a string"
print(firstString.charAtFifthIndex())
print(firstString.replaceCharAtSpecificIndex(index: 5, newChar: "i"))
print(secondString.removeWhiteSpaces())

print(thirdString.getNoOfWords())
