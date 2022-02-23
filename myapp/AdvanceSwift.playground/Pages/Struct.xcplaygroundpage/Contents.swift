//: [Previous](@previous)

import Foundation
print("1 Work type structure")
struct Person {
    var projname: [String]
    var loc: String
    var hour: Int

func printname() {
    for contact in contacts {
        print("Project names")
        print("\(contact.projname)")
    }
    }
}
var contacts: [Person] = []

var person1: Person = Person(projname: ["Jack","alex"], loc: "Surat", hour: 2)
var person2: Person = Person(projname: ["Stuti","bansi"], loc: "amd", hour: 3)

contacts.append(person1)
contacts.append(person2)

person2.printname()

//2
print()
print("2 initializer structure")
struct rectangle {
   var length: Double
   var breadth: Double
   init() {
      length = 6
      breadth = 12
   }
}

var area = rectangle()
print("area of rectangle is \(area.length*area.breadth)")

//3 with and without initialize parametr
print()
print("3. initialize with and without paramet")
class ShoppingListItem {
    var name: String? = "Pen"
    var quantity = 1
    var purchased = false
    var color: String?
    init(color: String){
        self.color = color
    }
}
var item = ShoppingListItem(color: "Black")
print(item.name!)
print(item.color!)
print(item.quantity)

//4 seperate odd even
print()
print("4. odd even array")
struct EvenAndOddNumbers {
    var inputArray: [Int]
    init (inputArray: [Int]) {
        self.inputArray = inputArray
    }
    var evenArray: [Int] {
        return inputArray.filter { $0 % 2 == 0 }
    }
    var oddArray: [Int] {
        return inputArray.filter { $0 % 2 != 0 }
    }
}
var newInputArray = [11, 12, 13, 14, 15]
var getFilteredNumbers = EvenAndOddNumbers(inputArray: newInputArray)
print("Even array: \(getFilteredNumbers.evenArray)")
print("Odd array: \(getFilteredNumbers.oddArray)\n")

//5
print("5 Person Struct")
struct Person1 {

var name: String
var age: Int
var gender:String
}
var contact: [Person1] = []
// instance of Person with memberwise initializer
var person3 = Person1(name: "Joe", age: 19, gender: "Male")
contact.append(person3)
var person4 = Person1(name: "Herry", age: 29, gender: "Male")
contact.append(person4)

for object in contact {
print("Name: \(object.name) Age: \( object.age) gender: \(object.gender)")
}

//6
print()
print("6. String in struct")
struct Example2 {
    var s: Any
}
var example = Example2(s: "")
example.s = "Hello"
var example2 = example
example2.s = "Hi"
print(example.s)
print(example2.s)
