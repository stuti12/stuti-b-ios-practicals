
import UIKit

class SignInTableViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.layer.borderWidth = 1
        tfEmail.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        
    }
    //MARK: IBActions
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if tfEmail.text == nil {
            print("No Email Entered")
        }
        if tfPassword.text == nil {
            print("No password Entered")
        }
    }
}

//MARK: Extentions
extension SignInTableViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEmail:
            tfPassword.becomeFirstResponder()
        default:
            break
        }
        return true
    }
}
