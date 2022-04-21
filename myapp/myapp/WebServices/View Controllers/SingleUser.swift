//
//  SingleUser.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 28/03/22.
//

import UIKit
import Alamofire
class SingleUser: UIViewController {
    
    //MARK: IBOutlet
    var userIndex: Int = Constants.one
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDetail(index: userIndex)
    }
}

//MARK: Extention
extension SingleUser {
    fileprivate func getUserDetail(index: Int) {
        guard let url = URL(string: "\(Constants.url)users/\(index)") else { return }
        AF.request(url, method: .get , parameters: nil, encoding :URLEncoding.default,  headers: nil, interceptor: nil, requestModifier: nil).response { (response) in
            
            switch response.result{
            case .success(let data):
                guard let responseData = data else { return }
                
                let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
                guard let newJson = try? JSONSerialization.data(withJSONObject: json as Any, options: .prettyPrinted) else{
                    break
                }
                guard let jsonData = try? JSONDecoder().decode(SingleUserData.self, from: newJson) else { return }
                let fetchedArray = jsonData.data
                if let imageName = URL(string: fetchedArray.avatar) {
                    let imageData = try? Data(contentsOf: imageName)
                    DispatchQueue.main.async {
                        self.userName.text = "\(fetchedArray.firstName) \(fetchedArray.lastName)"
                        self.userEmail.text = fetchedArray.email
                        self.userImage.image = UIImage(data: imageData!)}
                }
                break
            
            case .failure(let error):
                print("Error\(error.localizedDescription)")
                break
            }
        }
        
    }
}
