//
//  BindingTextField.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 18/04/22.
//

import Foundation
import UIKit

class BindingTextBox: UITextField {
    var textChanged: (String) -> () = { _ in }
    
    func bind(callback: @escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        self.textChanged(textField.text!)
    }
}
