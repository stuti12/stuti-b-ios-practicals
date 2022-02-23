//: [Previous](@previous)

import Foundation
class Student {
    var grade: Double = 0.0
    var mygrade = 9.0
    init(grade1: Double, grade2: Double, grade3: Double) {
        grade = (grade1 + grade2 + grade3) / 3
    }
}
var stud = Student(grade1: 22.0, grade2: 25.00, grade3: 28.00)
if stud.grade > stud.mygrade {
    print("Student Grades \(stud.grade) Above Average")

}
else {
    print("Grade below Average")
}
