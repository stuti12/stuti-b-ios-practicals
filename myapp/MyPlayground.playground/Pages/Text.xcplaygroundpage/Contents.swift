//: [Previous](@previous)

import Foundation

print("1. first two ele")
func first_two(_ input: String) -> String {
    let chars = String(input)
    let firstTwo = chars.prefix(2)
    
    return String(firstTwo)
}
print(first_two("Simform"))
/*
 var word: String = "Simform"

 var wordLength: Int = strlen(word)
 if wordLength >= 2 {
     print(word.prefix(2))
 }
 else {
    print(word)
 }
 
 */

print("")
print("2. without first and last")

var word: String = "Simform"

var wordLength: Int = strlen(word)
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
/*
 let index1 = string1.index(string1.startIndex, offsetBy: 1)

 let index2 = string2.index(string2.startIndex, offsetBy: 1)
 print(string1[index1...] + string2[index2...])
*/
print("")

print("4 move first 2 char at end")
var string1: String = "Swift"

var string2: String = "Examples"
if strlen(string1) >= 2 {

    let newString1 = string1.suffix(strlen(string1)-2) + string1.prefix(2)
    print(newString1)
}

print("")
print("5 test string start with 'sw'")
/*func starts_with_ab(_ input: String) -> Bool {
    if input.hasPrefix("sw")
    {
        return true
    }
    else
    {
        return false
    }
}
print(starts_with_ab("swift"))*/
print(string1.hasPrefix("sw"))

print("")

print("6. take first and last no. of character specified by user")
var str: String = "simform solutions"
print( str.prefix(3) + str.suffix(3))

//7
print("")
//string methods
var a:String="simform Solution"
print(a.prefix(2))

print(a.suffix(4))
print(a.uppercased())
print(a.count)

var greet = "Good Morning"
// insert ! to greet
greet.insert("!", at: greet.endIndex)
print(greet)
print(greet.lowercased())
var i = greet.index(greet.startIndex, offsetBy: 4)
// remove the character
greet.remove(at: i)

print(greet)
print(a.dropFirst())

var result = a.contains("Swift")

print(result)

print(String(greet.reversed()))
print(greet.sorted())
print(greet.shuffled())

