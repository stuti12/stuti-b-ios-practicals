import UIKit
//1
class Demo {
    var id: Int
    var name: String
    init(id: Int,name: String) {
        self.id = id
        self.name = name
    }
}
let demo = Demo(id:1,name:"Stuti")
demo.id = 3  //set
print(demo.id)  //get access
print(demo.name)
print()

//2 multiple initialize
print("2. Multiple Initializer")
class Person {
    var firstName: String?
    var clg: String?
    var dept: String?
    
    init(firstName: String, clg: String) {
        self.firstName = firstName
        self.clg = clg
    }
    
    init(firstName: String, dept: String) {
        self.firstName = firstName
        //self.clg = clg
        self.dept = dept
    }
}

let person = Person(firstName: "Stuti", clg:"VGEC")
print(" First name \(person.firstName!), clg: \(person.clg!) ")

let person3 = Person(firstName: "Stuti", dept: "CE")
print(" First name \(person3.firstName!), Dept: \(person3.dept!) ")

//3 without initializer
print()
print("Without Initializer")
class InitDemo {
    var id : Int = 0
    var name : String? = ""
}

var demo1 = InitDemo()
demo1.id = 1
demo1.name = "Stuti"
print("\(demo1.id) \(demo1.name!)")

print()
//4 squarer of number
print("4. Square of the number")
class Square {
     func squareNumber(number: Int) -> Int {
        return number * number
    }
}
var a = Square()
print(a.squareNumber(number: 2))

//5 inheritance
print()
print("5. Swift Inheritance")
class Coder {
      var favouriteEditor = "vi"
      init() {}
      func startEditorWar() {
          print("Obviously \(favouriteEditor) is best")
      }
  }
 
  class Rubyist:Coder {
     override init(){
         super.init()
         favouriteEditor = "TextMate"
    }
 }

 class Lisper:Coder {
     override init(){
         super.init()
        favouriteEditor = "emacs"
     }
 }

 var r = Rubyist()
 var l = Lisper()
 r.startEditorWar()
 l.startEditorWar()

//6 overriding
print()
print("6over riding method implementation")
class cricket {
   func prints() {
      print("Welcome to Swift 4 Super Class")
   }
}

class tennis: cricket {
   override func prints() {
      print("Welcome to Swift 4 Sub Class")
   }
}

let cricinstance = cricket()
cricinstance.prints()

let tennisinstance = tennis()
tennisinstance.prints()

//7 return power
print()
print("7. power of number")
class Example {
    var a:Double
    init(a: Double) {
        self.a = a
    }
   
    func doPower(num: Double) -> Double {
        return pow(a, num)    }
}
let instance = Example(a: 4.0)
print("Power of number")
print(instance.doPower(num: 4.0))

//8 car vehicle inheritance
print()
print("8. Car Bike Inheritance with diff properties")
class Vehicle {
    var speed:String  {
        return "150km"
    }
  // prevent overriding
   func displayInfo() {
    print("Vehicle class- Four Wheeler or Two Wheeler")
  }
}

// Car inherits Vehicle
class Car: Vehicle {
    override var speed: String {
        return "80km"
    }
    var color : String {
        return "Black"
    }
  // attempt to override
  override func displayInfo() {
      super.displayInfo()
      print("Vehicle speed \(super.speed)")
    print("Four Wheeler")
  }
}

var car1 =  Car()
print("car speed \(car1.speed)")
car1.displayInfo()
print("Color: \(car1.color)")

class Bike : Vehicle {
    var model : String {
        return "Hero"
    }
    override var speed: String {
        return "70km"
    }
    override func displayInfo() {
        super.displayInfo()
        print("Two Wheeler")
    }
    
}
var Bike1 = Bike()
print("Bike Model: \(Bike1.model)")
print("Bike Speed: \(Bike1.speed)")
Bike1.displayInfo()

//9 greet
print()
print("9. Greet message")
class Person1 {
    var name: String
    
    init(name: String) {
        self.name = name
    }

    func greet() {
        print("Hello \(name)")
    }
}
var p1 = Person1(name: "Stuti")
p1.greet()

//10 print String property of class
print()
print("10 String in class")
class Example2 {
    var s: String?
    
}
let example = Example2()
example.s = "Hello"
let example2 = example
example2.s = "Hi"
print(example.s!)
print(example2.s!)

