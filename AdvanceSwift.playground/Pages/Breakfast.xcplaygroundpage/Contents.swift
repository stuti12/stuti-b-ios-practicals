//: [Previous](@previous)

import Foundation

var baconAge = 3 // the bacon is 6 days old
var eggsAge = 2
if baconAge <= 21 && eggsAge <= 7 {
    print("you can cook bacon and eggs.")
}
else {
    if baconAge > 21 {
        print("throw out bacon.")
    }
    if eggsAge > 7 {
        print(" throw out eggs.")
    }
}

