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
    
    var coordinator: MainCoordinator?
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.MainViewController {
            guard segue.destination is UIWidgetMainViewController else { return }
            
        }
    }
    //MARK: IB ACtions
    
    @IBAction func goToUIWidgetVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.MainViewController, sender: self)
    }
    
    @IBAction func btnNavigation(_ sender: UIButton) {
        coordinator?.openFirstVC()
    }
}
