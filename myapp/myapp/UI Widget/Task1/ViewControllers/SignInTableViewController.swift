
import UIKit

class SignInTableViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    let alert = NSLocalizedString("Enter Email & Password", comment: "")
    let alertProperData = NSLocalizedString("Enter Proper Data", comment: "")
    
  
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.layer.borderWidth = 1
        tfPassword.layer.borderWidth = 1
        tfEmail.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        tfPassword.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1.0)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    //MARK: IBActions
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if self.tfEmail.text?.isEmpty == true {
            dispayAlert(msg: alert)
        }
        else if self.tfEmail.text?.isValidEmails == false {
            dispayAlert(msg: alertProperData)
        }
        else if self.tfPassword.text?.isEmpty == true {
            dispayAlert(msg: alert)
        }
        else {
            dispayAlert(msg: "Logged in")
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: Extentions
extension SignInTableViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEmail:
            tfEmail.resignFirstResponder()
            tfPassword.becomeFirstResponder()
        case tfPassword:
            tfPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    private func dispayAlert(msg: String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension String {
    var isValidEmails: Bool {
        NSPredicate(format: Constants.email, Constants.email2).evaluate(with: self)
    }
}
