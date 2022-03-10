//
//  ForthVC.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 11/03/22.
//

import UIKit

class ForthVC: UIViewController {
    
    //MARK: Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: IBActions
    
    @IBAction func popOver(_ sender: UIBarButtonItem) {
        let storyboard : UIStoryboard = UIStoryboard(name: Constants.storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.forthvc)
        vc.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        popover.barButtonItem = sender
        present(vc, animated: true, completion:nil)
    }
    
    @IBAction func btnPop(_ sender: UIButton) {
        guard let VC = self.navigationController?.viewControllers.filter({$0.isKind(of: FirstVC.self)}).first else {return}
        self.navigationController?.popToViewController(VC, animated: true)
        
    }
}
