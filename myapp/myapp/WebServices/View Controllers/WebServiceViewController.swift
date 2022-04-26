//
//  WebServiceViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 25/03/22.
//

import UIKit
class WebServiceViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var tfEnterMail: UITextField!
    @IBOutlet weak var tfEnterPassword: UITextField!
    
    let alertTitle = NSLocalizedString("Logged In Successful", comment: "")
    let contentType = NSLocalizedString("Content-Type", comment: "")
    let alert = NSLocalizedString("Enter Email & Password", comment: "")
    let alertFail = NSLocalizedString("Login Failed", comment: "")
    let alertProperData = NSLocalizedString("Enter Proper Data", comment: "")
    
    
    //MARK: - Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    //MARK: - IBActions
    
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let email = tfEnterMail.text else {
            return
        }
        guard let password = tfEnterPassword.text else {
            return
        }
        let user = UserRegiser(email: email, password: password)
        self.registerUser(user: user)
        
    }
    
}
//MARK: - Extention
extension WebServiceViewController {
    fileprivate func registerUser(user: UserRegiser) {
        if let url = URL(string:"\(Constants.url)login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = Constants.methodPost
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            }
            catch let error{
                print("\(error.localizedDescription)")
            }
            urlRequest.addValue(Constants.type, forHTTPHeaderField: contentType)
            urlRequest.addValue(Constants.type, forHTTPHeaderField: "Accept")
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                }
                guard let responseData = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(RegisterResponse.self,from:responseData)
                    guard let responseCode = (urlResponse as? HTTPURLResponse)?.statusCode else {
                        return
                    }
                    if( responseCode == Constants.noResponse) {
                        print(self.alertTitle)
                        print("token:\(userResponse.token ?? "nil")")
                        
                        DispatchQueue.main.async {
                            if self.tfEnterMail.text?.isEmpty == false && self.tfEnterPassword.text?.isEmpty == false {
                                if self.tfEnterMail.text?.isValidEmail == true {
                                    print(self.alertTitle)
                                }
                                else {
                                    DispatchQueue.main.async {
                                        self.dispayAlert(msg: self.alert)
                                    }
                                }
                            }
                            if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.dataview) as? UserDataViewController {
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                        }
                        
                    }
                    else {
                        DispatchQueue.main.async {
                            self.dispayAlert(msg: self.alertProperData)
                            
                        }
                    }
                    
                }   catch _ {
                    self.dispayAlert(msg: self.alertFail)
                }
            }
            dataTask.resume()
        }
    }
    private func dispayAlert(msg: String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension WebServiceViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfEnterMail:
            tfEnterMail.resignFirstResponder()
            tfEnterPassword.becomeFirstResponder()
        case tfEnterPassword:
            tfEnterPassword.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
