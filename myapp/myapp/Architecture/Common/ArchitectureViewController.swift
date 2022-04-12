//
//  ArchitectureViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 12/04/22.
//

import UIKit

class ArchitectureViewController: UIViewController {
   
   //MARK: - IBOutlet
    var coordinator: MVCCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func btnMVC(_ sender: UIButton) {
        coordinator?.goTOsecond()
    }
        
    @IBAction func btnMVP(_ sender: UIButton) {
        coordinator?.goToMVP()
    }
    
    @IBAction func btnMVVM(_ sender: UIButton) {
        coordinator?.goToMVVM()
    }
}
