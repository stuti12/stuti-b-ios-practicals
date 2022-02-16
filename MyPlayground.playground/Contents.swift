import UIKit

var greeting = "Hello, playground"
print(greeting)

//addition with 5
var c = 5
let d = 3
print(c + d)// => 8
print("")

//interest
let r=15
var p=1000
var n=3
var res=(r*p*n)/100
print(res)

//string concate
let string1 = "hello"
let string2 = " world"
var welcome = string1 + string2
print("\n"+welcome)

//operatior
var x = 7
var y = 2

// addition
print (x + y)
// subtraction
print (x - y)
// multiplication
print (x * y)

print(x / y)


//ifelse
var a = 5
let chr="a"

if a <= 5{
    print("a less than or qual to 5")
}

switch chr {
    case "a":
 print("\nthis is a")
case "b","c":
print("this is b or c")
default:
    print("not a")
}

for counter in 1...6{
    print("\nhello")
}
