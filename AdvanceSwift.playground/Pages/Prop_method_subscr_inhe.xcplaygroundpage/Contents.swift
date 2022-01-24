//: [Previous](@previous)

import Foundation

//1 property set outside class
print("1 propert set outside class")
class Circle{
     var radius = 2.5
     var area:Double {
         get {
             return(3.14 * radius * radius)
         }
    }
}

var c1 = Circle()

print(c1.area)          // 19.625
 //c1.area = 3.14         // get will
print(c1.radius)      // 1 = set will call r=sqrt(3.14/3.14)

//2
print()
print("Computed property")
class Circle1{
    var radius:Double
    var area:Double {
        get {
            return 3.14 * radius * radius
        }
        set(newValue) {
            radius = sqrt(newValue/3.14)
        }
    }
    init (radius:Double) {
        self.radius = radius
    }
}
var circle = Circle1(radius: 100)
circle.area = 31400
debugPrint("Radius of Circle is \(circle.radius)")

//3
print()
print("3 Stored property")
class Person{
    var name:String
    var age:Int
    var festival:String
    var message: String{
        return "Hi I am \(name), and I am \(age) years old. I wish you all a very Happy \(festival)"
    }
      
    init(name:String,age:Int,festival:String) {
        self.name = name
        self.age = age
        self.festival = festival
    }
}
var person = Person(name: "Stuti", age: 23, festival: "Diwali")
print(person.message)

print()
//4
print("4 private property")
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "aaba" {
        didSet {
            numberOfEdits += 1
        }
    }
}
//print(numberOfEdits)
var asa = TrackedString()
print(asa.numberOfEdits)
asa.value += "AAva"
asa.value += "Heyy"
print("Number of edits \(asa.numberOfEdits)")

 print()
print("5 Array and print value")
class Person1 {
    var id: Int
    var name: String
    init(name: String,id: Int) {
        self.id = id
        self.name = name
    }
}
let peopleArray = [Person1(name:"Bansi", id: 1),Person1(name: "Stuti", id: 2)]
             
for i in peopleArray {
    print("\(i.id) \(i.name)")
}

print()
print("6 willset and didset")
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

print()
print("7 lazy stored property")
class Employee{
    var name:String
    var id:Int
    var salary:Double
    var department:Department?
    init(name:String,id:Int,salary:Double) {
        self.name = name
        self.id = id
        self.salary = salary
    }
}
  
class Department{
    var name:String = "IT"
    lazy var employees = Array<Employee>()
}

var dep = Department()
dep.name = "CS"
  
var emp = Employee(name: "John", id: 102, salary: 25000.0)
emp.department = dep
dep.employees.append(emp)
print(" \(emp.name) \(emp.id) \(emp.salary) \(dep.name)")

print()
print("8 Inheritance")
class People{
    var name:String {
     return "Stuti"
    }
    var occu:String {
     return "Person"
    }
    func display(){
        print("Person class Info")
    }
    
}
class Student : People {
    override var name: String {
        return "Abc"
    }
    override var occu: String {
        return "Student"
    }
    var clg : String
    init(clg: String) {
        self.clg = clg
    }
    override func display(){
        super.display()
        print("Person name:\(super.name)  Occupation: \(super.occu)")
        print("Student class Info")
        
    }
}
let s = Student(clg: "Abc")
s.display()
print("Student name:\(s.name) occupation: \(s.occu) Clg Name:\(s.clg)")

class Emp: People {
    override var name: String {
        return "XYZ"
    }
    override var occu: String {
        return "Employee"
    }
    var cname : String
    init(cname : String) {
        self.cname = cname
    }
    override func display(){
        super.display()
        print("\nPerson name:\(super.name)  Occupation: \(super.occu)")
        print("Employee class Info")
    }
}
let e = Emp(cname : "Infosys")
e.display()
print("Employee name:\(e.name) occupation: \(e.occu) Company Name:\(e.cname)")

print()
print("9 mutating function")
struct Employees {
    var name : String
    var teamName : String

    init(name: String, teamName: String) {
        self.name = name
        self.teamName = teamName
    }
    
    mutating func changeTeam(newTeamName : String){
        self.teamName = newTeamName
    }
}

var emp1 = Employees(name : "Stuti", teamName:"Engineering")
print(emp1.teamName)    //Engineering
emp1.changeTeam(newTeamName : "Product")
print(emp1.teamName)    //Product

//10
print()
print("10 Methof Overriding")
class Base {
    var base : String
    init(base: String) {
        self.base = base
    }
    func display() {
        print(base);
    }
}

class Child : Base {
    var child : String
    init(child: String) {
        self.child = child
        super.init(base: "Hii Parent class")
    }
    override func display() {
        super.display()
        print(child)
    }
}
let child = Child(child: "Hello child class method override")
child.display()

//11
print()
print("11 Type methods")
public class Numbers {
    static func findMinimum(number1: Int, number2: Int) -> Int {
         var minimum: Int = number2
        if number1 < number2 {
            minimum = number1
        }
        return minimum
    }
}

var min = Numbers.findMinimum(number1: 3, number2: 5)
print("Minimum: \(min)")

print()
print("12 class method and static method")
class Numbers1 {
    static func findMinimum(number1: Int, number2: Int) -> Int {
        //3 stored in number1, 5 stored in number2
        var minimum: Int = number2
        if number1 < number2 {
            minimum = number1
        }
        return minimum
    }
    class func appUtility(){
            print("In AppUtils")
    }
}
class ChildNumbers1 : Numbers1 {
    override class func appUtility(){
            print("In AppOtherUtils")
    }
    /*override static func findMinimum(number1: Int, number2: Int) -> Int {
        var minimum: Int = number2
        if number1 < number2 {
            minimum = number1
        }
        return minimum
    }*/
}
ChildNumbers1.appUtility()
ChildNumbers1.findMinimum(number1: 1, number2: 4)

print()
print("13 subscript array")
class daysofaweek {
private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
subscript(index: Int) -> String {
get {
return days[index]
}
set(newValue) {
self.days[index] = newValue
}
}
}
var p = daysofaweek()
print(p[0]) // prints sunday
p[0] = "Monday"
print(p[0])

print()
print("14 return character at position using subscript")
extension StringProtocol {
    subscript (offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
let input = "Swift Tutorials"
let char = input[3]
print(char)

print()

print("15 subscript all string bw range")
//enumrated - return A sequence of pairs enumerating the seq.
//reduce()-method to produce a single value from the elements of an entire sequence.
extension String {
    subscript(range: ClosedRange<Int>) -> String {
        return enumerated().filter{$0.offset >= range.first! && $0.offset < range.last!}
            .reduce(""){$0 + String($1.element)}
    }
}
let myStr = "abcd"
print(myStr[0...3]) // produces "ab"

//16
print()
print("16 functio print element between range")

class ArrFun {
    func returningArr(rang: ClosedRange<Int>) {
let arr2: Array = [1,33,78,21]
for index in rang {
    print(" \(arr2[index])")
}
}
}
var arr3 = ArrFun()
arr3.returningArr(rang: 0...2)
 
print()
print("17 Access key value function")
class SubscriptDictExample {
var givenDictionary = [1: "Hello", 2: "Hi", 3: "Hey"]
    subscript (givenKey: Int) -> String? {

        if let value = givenDictionary[givenKey] {
            return value
        } else {
            return nil
        }
    }

}
var subscriptDictObject = SubscriptDictExample()

var inputKey = 2

if let outputValue = subscriptDictObject[inputKey] {
    print("Key: \(inputKey), Value: \(outputValue)\n")
} else {
    print("Cannot find key!\n")
}

print()
print("18 print person details subscript")
class PersonDetail {

    var details =   [
                        [
                            "name": "Abc",
                            "birthDate": "1 Jan 2000",
                            "age": 22,

                        ],
                        [
                            "name": "Def",
                            "birthDate": "31 Aug",
                            "age": 26,
                    ]

                    ]

    var detailArray: [String: Any] = [:]
    subscript(name: String) -> [String: Any] {
        for detail in details {

            if detail["name"] as! String == name {
                detailArray = detail
                break
            }
        }
        return detailArray

    }
}

var personDetail = PersonDetail()

print(personDetail["Abc"])
print()
print("19 music Inheritance")
class Music {
    var Singer : String {
        return "Singer property music class"
    }
    var composer : String {
        return "Composer music class"
    }
}
class HipHop : Music {
    override var Singer: String {
        print(super.Singer)
        return "Singer Hip Hop"
    }
    
    override var composer: String {
        print(super.composer)
        return "Composer Hip-Hop"
    }
}
class Classical : Music {
    override var Singer: String {
        return "Singer classical"
    }
    
    override var composer: String {
        return "Composer Classical"
    }
}

var obj = HipHop()
print(obj.Singer)
print(obj.composer)
var obj2 = Classical()
print(obj2.Singer)

print()
print("20 readwrite property")
class ReadWrite {
    var value: String {
    get {
        return self.value
    }
    set(newValue) {
        value = newValue
    }
}
}
var rw = ReadWrite()
rw.value = "Stuti"
print(rw.value)
