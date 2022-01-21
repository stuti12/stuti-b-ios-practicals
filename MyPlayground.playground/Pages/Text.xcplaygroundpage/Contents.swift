//: [Previous](@previous)

import Foundation

print("1. first two ele")
func firstTwo(_ input: String) -> String {
    let charPrefix = String(input)
    let firstTwoChar = charPrefix.prefix(2)
    
    return String(firstTwoChar)
}
print(firstTwo("Simform"))

print("")
print("2. without first and last")

var word : String = "Simform"

var wordLength : Int = strlen(word)
let indexStartSubstring = word.index(word.startIndex, offsetBy: 1)
let indexEndSubstring = word.index(word.endIndex, offsetBy: -2)
var substring = word[indexStartSubstring...indexEndSubstring]

if wordLength >= 2 {
    print(substring)
}

else {
    print(word)
}

print("")
print("3. concate bt except first char")
func concate_str(_ str1: String, _ str2: String) -> String {
    var part1 = String(str1)
    var part2 = String(str2)
    part1.removeFirst()
    part2.removeFirst()
    
    return String(part1)+String(part2)
}
print(concate_str("Swift", "Examples"))
print("")

print("4 move first 2 char at end")
var stringOne: String = "Swift"

var stringTwo: String = "Examples"
if strlen(stringOne) >= 2 {

    let newStringOne = stringOne.suffix(strlen(stringOne)-2) + stringOne.prefix(2)
    print(newStringOne)
}

print("")
print("5 test string start with 'sw'")

print(stringOne.hasPrefix("sw"))

print("")

print("6. take first and last no. of character specified by user")
var strFirstLast: String = "simform solutions"
print( strFirstLast.prefix(3) + strFirstLast.suffix(3))

//7
print("")
//string methods
var strFun : String="simform Solution"
print(strFun.prefix(2))

print(strFun.suffix(4))
print(strFun.uppercased())
print(strFun.count)

var greetMsg = "Good Morning"
// insert ! to greet
greetMsg.insert("!", at: greetMsg.endIndex)
print(greetMsg)
print(greetMsg.lowercased())
var i = greetMsg.index(greetMsg.startIndex, offsetBy: 4)
// remove the character
greetMsg.remove(at: i)

print(greetMsg)
print(strFun.dropFirst())

var result = strFun.contains("Swift")

print(result)

print(String(greetMsg.reversed()))
print(greetMsg.sorted())
print(greetMsg.shuffled())

