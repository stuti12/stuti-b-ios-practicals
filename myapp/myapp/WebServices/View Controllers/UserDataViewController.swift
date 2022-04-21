//
//  UserDataViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 28/03/22.
//

import UIKit
import CoreMedia
import Alamofire

class UserDataViewController: UIViewController {
  
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnAdd: UIButton!
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    var userResultArray = [UserData]()
    let listUsers = NSLocalizedString("List Users", comment: "")
    let contentType = NSLocalizedString("Content-Type", comment: "")
    let loading = NSLocalizedString("Loading..", comment: "")
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(clickAdd))
        navigationItem.rightBarButtonItems = [addButton]
        
        parseData()
        
    }
    
    //MARK: Function for parseData
    
    func parseData() {
        activityIndicatorShow(loading)
        guard let url = URL(string: "\(Constants.url)users?delay=3") else {
            return
        }
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        var request = URLRequest(url: url)
        request.httpMethod = Constants.method
        request.addValue(Constants.type, forHTTPHeaderField: contentType)
        
        let dataTask = URLSession.shared.dataTask(with:request) { data, urlResponse, error in
            
            do {
                guard let data = data else {
                    return
                }
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    return
                    
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    return
                }
                guard let fetchData = try? JSONDecoder().decode(UserListData.self, from: prettyJsonData) else {
                    return
                }
                self.userResultArray = fetchData.data
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.effectView.removeFromSuperview()
                    
                }
                DispatchQueue.main.async{[weak self] in
                    guard let uSelf = self else {return}
                    uSelf.tableView?.reloadData()
                }
            }
            catch {
               
            }
        }.resume()
    }
}
//MARK: Extentions
extension UserDataViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userResultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCell, for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        let element = userResultArray[indexPath.row]
        if let urlImage = URL(string: element.avatar) {
            let name = "\(element.firstName) \(element.lastName)"
            let email = "\(element.email)"
            cell.tag = element.id
            cell.configureCellValue(name: name, email: email,imageName: urlImage)
        }
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.single) as? SingleUser {
            let indexPath = tableView.indexPathForSelectedRow!
            let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
            let index = currentCell.tag
            vc.userIndex = index
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return listUsers
    }
}

extension UserDataViewController {
    func activityIndicatorShow(_ title: String) {
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        strLabel = UILabel(frame: CGRect(x: Constants.fifty, y: Constants.zero, width: Constants.hundredSixty, height: Constants.fortySix))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: CGFloat(Constants.fifteen), weight: .medium)
        effectView.frame = CGRect(x: Int(view.frame.midX - strLabel.frame.width/2), y: Int(view.frame.midY - strLabel.frame.height/2) , width: Constants.hundredSixty, height: Constants.fortySix)
        effectView.layer.cornerRadius = CGFloat(Constants.fifteen)
        effectView.layer.masksToBounds = true
        activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.frame = CGRect(x: Constants.zero, y: Constants.zero, width: Constants.fortySix, height: Constants.fortySix)
        activityIndicator.startAnimating()
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
}

extension UserDataViewController {
    @objc func clickAdd() {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddUser") as? AddUser {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}



