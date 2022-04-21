//
//  AddUser.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 29/03/22.
//

import UIKit
import Alamofire

class AddUser: UIViewController {
    //MARK: IBOutlets
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfAddJob: UITextField!
    let name = NSLocalizedString("name", comment: "")
    let job = NSLocalizedString("job", comment: "")
    let emptyData = NSLocalizedString("Enter Mandatory data", comment: "")
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    @IBAction func brnAdd(_ sender: UIButton) {
        addUser(name: tfUserName.text ?? "no data", job: tfAddJob.text ?? "no data")
    }
    
}
//MARK: Extention
extension AddUser {
    fileprivate func addUser(name: String, job: String) {
        let parameters = [
            name: name,
            job: job
        ]
        if tfUserName.text?.isEmpty == true || tfAddJob.text?.isEmpty == true  {
            let alert = UIAlertController(title: "", message: emptyData, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            guard let url = URL(string: "\(Constants.url)users/") else { return }
            AF.request(url, method: .post , parameters: parameters, encoding :URLEncoding.default,  headers: nil, interceptor: nil, requestModifier: nil).response { (response) in
                switch response.result{
                    
                case .success(let data):
                    
                    guard let responseData = data else { return }
                    
                    let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
                    guard let newJson = try? JSONSerialization.data(withJSONObject: json as Any, options: .prettyPrinted) else{
                        break
                        
                    }
                    guard let jsonData = try? JSONDecoder().decode(AddUserData.self, from: newJson) else { return }
                    
                    let statusCode = (response.response?.statusCode)!
                    print(statusCode)
                    
                    guard let jsonResponse = try? JSONDecoder().decode(AddUserResponse.self, from: newJson) else { return }
                    
                    if statusCode == Constants.responseCode {
                        DispatchQueue.main.async {
                            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 500, height: 21))
                            label.center = CGPoint(x: 280, y: 485)
                            label.textAlignment = .center
                            label.text = "Name:\(jsonResponse.name) \n Job: \(jsonResponse.job) \n id: \(jsonResponse.id) \n createdAt: \(jsonResponse.createdAt)"
                            label.textAlignment = .center
                            label.lineBreakMode = NSLineBreakMode.byWordWrapping
                            label.sizeToFit()
                            self.view.addSubview(label)
                            print("Data Added")
                            
                        }
                    }
                    else {
                        print("Invalid Error")
                    }
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    break
                }
            }
        }
    }
}
