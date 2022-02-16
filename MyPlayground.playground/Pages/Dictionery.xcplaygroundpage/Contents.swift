//: [Previous](@previous)

import Foundation

print("1. decode message")
var code:[String:String]=["a" : "b", "b" : "c", "c" : "d", "d" : "e", "e" : "f", "f" : "g", "g" : "h", "h" : "i",
    "i" : "j", "j" : "k", "k" : "l", "l" : "m", "m" : "n",
    "n" : "o", "o" : "p", "p" : "q", "q" : "r", "r" : "s",
    "s" : "t", "t" : "u", "u" : "v", "v" : "w", "w" : "x",
    "x" : "y", "y" : "z", "z" : "a"]
var result = ""
var msg="uijt nfttbhf jt ibse up sfbe"
for i in msg{

    if i == " " {
        result = result + String(i)
    }
    for (key,value) in code {

        if(String(i) == value) {
            result = result + key
        }
    }
}
print(result)
print()

//2
print("2. print first name")
var people: [[String:String]] = [
[

"firstName": "Calvin",
"lastName": "Newton"
],
[
"firstName": "Garry",
"lastName": "Mckenzie"
],
[
"firstName": "Leah",

"lastName": "Rivera"
],
[
"firstName": "Sonja",
"lastName": "Moreno"

],
[
"firstName": "Noel",
"lastName": "Bowen"
]
]
var firstNameArray = [String]()

for (object) in people{
    if let tempName = object["firstName"] {
        //print(tempName)
        firstNameArray.append(tempName)
    }
}
print(firstNameArray)
print()

//3
var lastNameArray = [String]()
for (object) in people{
    if let tempName1 = object["firstName"] {
        if let tempName2 = object["lastName"] {
        //print(tempName)
        lastNameArray.append(tempName1)
        lastNameArray.append(tempName2)
    }
}
}
print(lastNameArray)
print()

print("4. print name of person having min score")
var peoples: [[String:Any]] = [

[
"firstName": "Calvin",
"lastName": "Newton",
"score": 13
],

[
"firstName": "Garry",
"lastName": "Mckenzie",
"score": 12
],

[
"firstName": "Leah",
"lastName": "Rivera",
"score": 10
],

[
"firstName": "Sonja",
"lastName": "Moreno",
"score": 3
],

[
"firstName": "Noel",
"lastName": "Bowen",
"score": 16
]
]
var smallest = 1234567890
for object in peoples {
    if let score = object["score"]{
        var temp : Int
        temp = score as! Int
        if temp < smallest {
            smallest = temp
        }
    }
}
for object in peoples {
    if let temp = object["score"] , let firstName = object["firstName"] ,
        let lastName = object["lastName"] {
            if temp as! Int == smallest {
                print("\(firstName) \(lastName)")
            }
    }
}
print()

print("5. leaderboard")
for i in peoples.indices {

    let firstName = peoples[i]["firstName"] ?? "Nil"
    let lastName = peoples[i]["lastName"] ?? "Nil"
    let score = peoples[i]["score"] ?? "nil"
    print("\(i) . \(firstName) \(lastName) - \(score)")
}
print()

print("6: frequency of each")
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var dictionary: [Int : Int] = [:]
numbers.sort()
var counter = 0
var compareElement = numbers[0]
for number in numbers {
    if number == compareElement {
        counter += 1
        dictionary[number] = counter
    } else {
        compareElement = number
        counter = 1
        dictionary[number] = counter
    }
}
var keys = dictionary.keys.sorted()
for key in keys {
    if let counts = dictionary[key] {
        print("\(key) \(counts)")
    }
}
