//
//  SecondViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var lblmessage: UILabel!
    
    var data = ""
   //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showAlertBox(message: "Second View Controller")
        lblmessage.text = data
    }
    
    //MARK: IBAction
    
    //MARK: Function
    private func showAlertBox(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
