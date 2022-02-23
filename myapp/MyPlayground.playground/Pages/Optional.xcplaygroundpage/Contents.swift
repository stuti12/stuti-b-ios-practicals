//: [Previous](@previous)

import Foundation

print("Optional Declarre")
var maybeANumber = "19375"
var number:Int? = Int(maybeANumber)
print(maybeANumber)

//forced unwraping
print("")
var myString:String?

myString = "Hello, Swift 4!"

if myString != nil {
   print( myString! )
} else {
   print("myString has nil value")
}
//auto unwrapping
/*
 var myString:String!
 myString = "Hello, Swift 4!"
 if myString != nil {
    print(myString)
 } else {
    print("myString has nil value")
 }
 */

//optional binding
var myString1:String?
myString1 = "Hello, Swift 4!"
print("")
if let yourString = myString1 {
   print("Your string has - \(yourString)")
} else {
   print("Your string does not have a value")
}

print("")
print("IF let")
let colors = ["red", "green", "blue"]

if let index = colors.firstIndex(where: {$0.elementsEqual("green")}) {
  print("green is present in palette at position \(index)")
} else {
  print("green is not present in palette")
}

print("")
print("Guard Let")
func checkAge() {
    
  var age: Int? = 22

  guard let myAge = age else {
    print("Age is undefined")
    return
  }

  print("My age is \(myAge)")
}
checkAge()

//nil colising operator
print("")
print("nil colloison operator ")
let favoriteFood:String? = nil
let whatsForDinner = favoriteFood ?? "Fish and chips"
print(favoriteFood)
