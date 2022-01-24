// Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and
//if password is empty, throw “Empty password” exception
enum Password: Error {
    case passwdTooShort
    case passwdEmpty
}
class SetPassword {
    func isPasswdValid(_ password: String) throws -> Bool {
        guard password.count > 0 else {
            throw Password.passwdEmpty
        }
        guard password.count >= 8 else {
            throw Password.passwdTooShort
        }
        return true
    }
}
var newPassword = SetPassword()
let currentPassword = ""
do {
    try newPassword.isPasswdValid(currentPassword)
    print("Current password is a valid password\n")
} catch Password.passwdTooShort {
    print("Password is too short\n")
} catch Password.passwdEmpty {
    print("Password can not be empty\n")
}

//Create a program for shopping cart. If desired quantity for an item is not available, throw exception
enum ShoppingCartError: Error {
    case stockNotAvailable
}
class ShoppingCart {
    var firstItemQuantity = 10
    var secondItemQuantity = 8
    var thirdItemQuantity = 5
    
    func buyFirstItem(quantity: Int) throws {
        guard quantity <= firstItemQuantity else {
            throw ShoppingCartError.stockNotAvailable
        }
        firstItemQuantity -= quantity
    }
    func buySecondItem(quantity: Int) throws {
        guard quantity <= secondItemQuantity else {
            throw ShoppingCartError.stockNotAvailable
        }
        secondItemQuantity -= quantity
    }
    func buythirdItem(quantity: Int) throws {
        guard quantity <= thirdItemQuantity else {
            throw ShoppingCartError.stockNotAvailable
        }
        thirdItemQuantity -= quantity
    }
}
var myShoppingCart = ShoppingCart()
var buyQuantity = 8
do {
    try myShoppingCart.buyFirstItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from first item.")
} catch ShoppingCartError.stockNotAvailable {
    print("Cannot buy desired amount of items from first item.")
}
do {
    try myShoppingCart.buySecondItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from second item.")
} catch ShoppingCartError.stockNotAvailable {
    print("Cannot buy desired amount of items from second item")
}
do {
    try myShoppingCart.buythirdItem(quantity: buyQuantity)
    print("Succesfully bought \(buyQuantity) items from third item.")
} catch ShoppingCartError.stockNotAvailable {
    print("Cannot buy desired amount of items from third item")
}
print("Total items available: First: \(myShoppingCart.firstItemQuantity), Second: \(myShoppingCart.secondItemQuantity), Third: \(myShoppingCart.thirdItemQuantity)\n")

//nil colision

let names = ["a":"Bansi","b":"Stuti"]
let name = names["B"] ?? "Mansi"
print(name)
print(names)
