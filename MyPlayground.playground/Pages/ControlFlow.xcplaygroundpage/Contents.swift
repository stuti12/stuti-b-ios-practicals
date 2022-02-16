//: [Previous](@previous)

import Foundation


func main() {
   print("1.power of 2")
    /*while other approach (j <= n) {
     var num: Int = 100

     var j: Int = 2
      print(j)
       j = j * 2
    }*/
    var prod = 2
    for _ in 1...100 where prod <= 100 {
        print("Prod = \(prod)")
        prod *= 2
    }
   
    //prog 2
    print("\n2. Square Matrix * pattern")
    func upsideDown(_ int : Int) {
        for i in 0...int-1
        {
            print(String.init(repeating: "*", count: int))
        }
    }

    print("")
    upsideDown(3)

    //prog 3
    print("")
    print("Star pattern")
    let rows = 5
    var i = 1
    while i <= rows {
        print(String(repeating: "*", count: i))
        i += 1
    }
    
    print("")
    print("Pyramid *")
    func starprintTraingle(_ int : Int) {
     for i in 1...int {
       print(String.init(repeating: " ", count: int-i) + String.init(repeating: "*", count: 2*i - 1))
     }
    }
    starprintTraingle(5)
    
    //prime number
    print("")
    print("prime number program")
    var flag : Bool = false;
    let number : Int = 13;
    for i in 2...number/2 {
    if(number % i == 0) {
    flag = true
    break;
    }
    }
    if flag == false {
    print("\(number ) is prime!");
    } else {
    print("\(number ) is not prime!");
    }
   
    //for eaxh
    print()
    var fruits : [String] = ["Apple", "Banana", "Mango", "abc"]
     
    fruits.forEach { fruit in
        print(fruit)
        //print($0)
    }
}

main();



