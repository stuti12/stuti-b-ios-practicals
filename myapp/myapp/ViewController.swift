//
//  ViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 11/01/22.
//

import UIKit
import AVFoundation
import Foundation
class ViewController: UIViewController {
    //MARK: IBOutlet
    var coordinator: MainCoordinator?
    
    //MARK: Lifecycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    //MARK: IBActions
  
    @IBAction func btnArchitecture(_ sender: UIButton) {
        coordinator?.openArch()
        
    }
}
