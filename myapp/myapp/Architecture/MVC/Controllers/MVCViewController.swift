//
//  MVCViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 12/04/22.
//

import UIKit

class MVCViewController: UIViewController {
    
    //MARK: IBOutlets
    var data: Login?
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var lblLogin: CircleLabel!
    @IBOutlet weak var tfPassword: UITextField!
    var coordinator: MVCCoordinator?
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: IBActions
    @IBAction func btnLogin(_ sender: UIButton) {
        if tfEmail.text?.isEmpty == true || tfPassword.text?.isEmpty == true {
            showAlertBox(message: "Email address or Password cant be empty")
        }
        else if tfEmail.text!.isValidEmail == false{
            showAlertBox(message: "Email ID Invalid")
        }
        else {
            data = Login(email: tfEmail.text ?? "no data", pswd: tfPassword.text ?? "no data")
            showAlertBox(message: "Email: \(data?.email ?? "No data") \n Password:\(data?.pswd ?? "No password")" )
            lblLogin.text = "Logged in Successfully"
        }
    }
    
    //MARK: Functions
    
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: Extention Validation
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension MVCViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
}
