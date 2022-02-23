//: [Previous](@previous)

import Foundation

//1
print("Take inputs and print Day also for invaalid case")
enum WeekDays: Int {
    case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    var short: String {
            switch self {
            case .Monday :
                return "Mon"
            case .Tuesday :
                return "Tue"
            case .Wednesday :
                return "Wed"
            case .Thursday :
                return "Thur"
            case .Friday :
                return "Fri"
            case .Saturday :
                return "Sat"
            case .Sunday :
                return "Sun"
            
            }
}
}
let curDay : String
if let curDay = WeekDays(rawValue: 2) {
    print("\(curDay)\(curDay.short)")
} else {
    print("Invalid")
}
//2 days of month
print()
print("2 print no of day in month")
enum Months   {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    func getDays() -> Int {
        switch self {
            case .January, .March, .May, .July, .August, .October, .December:
            return 31
            case .February:
            return 28
            case .April, .June, .September, .November  :                return 30
        }
        
    }
    
}
let days = Months.June.getDays()
print(days)

//3
print("3 int enum")
enum week {
    case mon
    case tue
    func getNum() -> Int {
    switch self {
    case .mon:
    return 1
    case .tue:
    return 2
    default :
    return 0
    }
    }
}
let varr = week.mon.getNum()
print(varr)

print()
print("4 String enum")
enum MoveDirection1 : String {
    case forwards = "you moved forward"
    case backs = "you moved backwards"
    case lefts = "you moved to the left"
    case rights = "you moved to the right"
    func printDirection() -> String {
        return self.rawValue
    }
}
var action1 = MoveDirection1.rights;
print(action1.printDirection())
print(MoveDirection1.backs.rawValue)

//6) Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and
print()
print("6 Case Iterable enum")
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

enum CompassDirection: CaseIterable {
    case north, south, east, west
}
print("There are \(CompassDirection.allCases.count) directions.")
// Prints "There are 4 directions."
let caseList = CompassDirection.allCases
                               .map({ "\($0)" })
                               .joined(separator: ", ")

/// 7 Write a swift program using enumerations for learn and demonstrate enum cases with parameters (Enum with associated values)
print()
print("7 Enum with Assiciated value + Int Enum")
enum BankDeposit {
    case inValue(Int, Int, Int)
    case inWords(String)
}
func makeDeposit(_ person: BankDeposit) {
    switch person {
    case .inValue(let hundred, let tens, let ones):
        print("deposited: \((hundred * 100) + (tens * 10) + (ones * 1))")
    case .inWords(let words):
        print("deposited: \(words)")
    }
}
var thirdPerson = BankDeposit.inValue(1,2,5)
makeDeposit(thirdPerson) //prints deposited: 125
var fourthPerson = BankDeposit.inWords("One Hundred Twenty Five")
makeDeposit(fourthPerson)

// Create an enum with its rawValues of type String and show usage of case to print value of case
print()
print("5/8 rawValue enum")
enum MoveDirection : String {
    case forward = "you moved forward"
    case back = "you moved backwards"
    case left = "you moved to the left"
    case right = "you moved to the right"
    func printDirection() -> String {
        return self.rawValue
    }
}
var action = MoveDirection.right;
print(action.printDirection())
print(MoveDirection.back.rawValue)
