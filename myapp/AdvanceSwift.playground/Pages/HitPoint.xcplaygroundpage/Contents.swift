//: [Previous](@previous)

import Foundation
var hp=60
if hp < 20 && hp > 0 {
    hp = 20
} else if hp % 10 != 0 {
    hp = hp / 10
    hp = hp + 1
    hp = hp * 10
}
print(hp)
