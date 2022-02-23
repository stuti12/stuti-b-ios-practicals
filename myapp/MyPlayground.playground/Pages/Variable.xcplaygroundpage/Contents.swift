//: [Previous](@previous)

import Foundation
print("Variables Declaration")
//static
print("Static variable")
class Student {
   static let section: String = "Section: A"  // static constat
   static var day: String = "Monday" // static variable
   var name: String = "Akash"        // instance variable
   var rollNum: Int = 1              // instance variable
}
let student1 = Student()   // Object 1
print(student1.rollNum )  //1
print(student1.name)       // Akash
student1.name = "Aman"     // Setting ob1 value to Aman
print(student1.name)
print(Student.day)
print(Student.section)

print("")
var greeting = "Hello, playground"
print(greeting)

var varA:Int = 42
print(varA)

var varB:Float
varB = 3.14159
print("float",+varB)

let char1: Character = "A"
print(char1)

//optional
var maybeANumber = "19375"
var number:Int? = Int(maybeANumber)
print(maybeANumber)

var a: Bool = true
print(a)

//tuple
var product = (iphone: "X", price: 1000)
print(product)         //(iphone: "X", price: 1000) //current value
product.price = 1200   //Change value,
print(product)

//constant
let constA = 42
print("constant",+constA)

//type annotation
let constB:Float = 3.14159
print(constB)

//2. Addition with 5
print("")
print("Addition with 5")
var c = 5
var d = 3
print(c + d)// => 8

//interest
let r = 15
var p = 1000
var no = 3
var res=(r*p*no)/100
print("Interest is")
print(res)
