//: [Previous](@previous)

import Foundation

//1
print("1. First & Last element equal")
func checkFirstLast(_ arrElement: [Int]) -> Bool {
    guard arrElement.count > 0 else {
        return false
    }
    if arrElement.first == arrElement.last {
        return true
    }
    else {
        return false
    }
}
print (checkFirstLast ([1, 2, 3]))
print (checkFirstLast ([1, 2, 3, 1]))

//2
print("2. New array with double length")
func newArrayDoubleLength(_ arrLength: [Int]) -> [Int] {
    var new_array: [Int] = [arrLength.last!]
    
    for _ in arrLength {
        new_array.insert(0, at: new_array.startIndex)
        new_array.insert(0, at: new_array.startIndex)
    }
    new_array.remove(at: 0)
    
    return new_array
}
print(newArrayDoubleLength([1, 2, 3, 4]))

//3
print("")
print("3.Taking first two element")
func newArrayForTwoElement(_ arrTwoElement: [Int]) -> [Int] {
    guard arrTwoElement.count > 1
    else {
        return arrTwoElement
    }
    return Array(arrTwoElement.prefix(2))
}
print(newArrayForTwoElement([0, 1, 2, 3, 4]))
print(newArrayForTwoElement([0, 1, 2]))
print(newArrayForTwoElement([0]))

//4
print("")
print("4. max from array")
var numbers = [9, 34, 11, -4, 27]

print(numbers.max()!)

//5
print("")
print("5. Sorting")
var arrSort:[Int] = [12,10,25,20,50]
print("Original array: ",arrSort)
arrSort.sort()
arrSort.reverse()

print("Sorted array: ",arrSort)

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
var arraFun:[Int] = [12,10,25,20,50]
print("Count")
print(arraFun.count)
print("Sort Array")
print(arraFun.sorted())
arraFun.insert(12, at: 5)
print(arraFun)
print("Swap")
arraFun.swapAt(1, 3)
print(arraFun)
print(arraFun.shuffled())
print(arraFun.removeLast())
print(arraFun)

for (index, number) in arraFun.enumerated() {
    print("Elements \(index):  \(number)")
}
print(arraFun.isEmpty)
var address: [Any] = ["Scranton", 570]

print(address)
print(arraFun.append(3))

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
