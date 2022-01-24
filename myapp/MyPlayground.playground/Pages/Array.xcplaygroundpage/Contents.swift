//: [Previous](@previous)

import Foundation

//1
print("1. First & Last element equal")
func check_first_last(_ arra: [Int]) -> Bool {
    guard arra.count > 0 else
    {
        return false
    }
    if arra.first == arra.last
    {
        return true
    } else
    {
        return false
    }
}
print(check_first_last([1, 2, 3]))
print(check_first_last([1, 2, 3, 1]))

//2
print("2. New array with double length")
func new_array(_ a: [Int]) -> [Int] {
    var new_array: [Int] = [a.last!]
    
    for _ in a {
        new_array.insert(0, at: new_array.startIndex)
        new_array.insert(0, at: new_array.startIndex)
    }
    new_array.remove(at: 0)
    
    return new_array
}

print(new_array([1, 2, 3, 4]))

//3
print("")
print("3.Taking first two element")
func new_array1(_ a: [Int]) -> [Int] {
    guard a.count > 1 else
    {
        return a
    }
    
    return Array(a.prefix(2))
}
print(new_array1([0, 1, 2, 3, 4]))
print(new_array1([0, 1, 2]))
print(new_array1([0]))

//4
print("")
print("4. max from array")
var numbers = [9, 34, 11, -4, 27]

print(numbers.max()!)

//5
print("")
print("5. Sorting")
var arr:[Int] = [12,10,25,20,50]

print("Original array: ",arr)
arr.sort()
arr.reverse()

print("Sorted array: ",arr)

//6
print("")
print("6. Divisibility")
var listOfNumbers: [Int] = [1, 2, 3, 10, 100]

var divisor: [Int] = [2, 5]
for num in listOfNumbers {
    for div in divisor {
        if num % div == 0 {

            print(num,terminator: " ")
            break
        }
    }

}

//7 methods
print()
print("\n7. Array Functions")
var arra:[Int] = [12,10,25,20,50]
print("Count")
print(arra.count)
print("Sort Array")
print(arra.sorted())
arra.insert(12, at: 5)
print(arra)
print("Swap")
arra.swapAt(1, 3)
print(arra)
print(arra.shuffled())

print(arra.removeLast())
print(arra)

for (index, number) in arra.enumerated() {
    print("Elements \(index):  \(number)")
}

//print(arra.popLast())

print(arra.isEmpty)
var address: [Any] = ["Scranton", 570]

print(address)
print(arra.append(3))

print()
print("Reduce Function")
struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}
let peopleArray = [ Person(name:"Santosh", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift VXI"]),
             Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift VXI"]),
             Person(name:"Amit", address:"Nagpure, India", age:17, income: 200000.0, cars:Array())]
let totalIncome = peopleArray.reduce(0) {(result, next) -> Double in
    return result + next.income
}
print("Total Income: \(totalIncome) Average Income: \(totalIncome/Double(peopleArray.count))")
