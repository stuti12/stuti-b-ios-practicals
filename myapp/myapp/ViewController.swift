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
        print("viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view Did Appear")
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.MainViewController {
            guard segue.destination is UIWidgetMainViewController else { return }
            
        }
    }
    //MARK: - IB ACtions
    
    @IBAction func goToAutoLayoutbtn(_ sender: UIButton) {
       
    }
    
    @IBAction func goToUIWidgetVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.MainViewController, sender: self)
    }
    
    @IBAction func btnNavigation(_ sender: UIButton) {
        coordinator?.openFirstVC()
    }
    
    @IBAction func btnWebApi(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == Constants.webService {
                guard segue.destination is WebServiceViewController else { return }
            }
        }
    }
    
    @IBAction func btnArchitecture(_ sender: UIButton) {
        coordinator?.openArch()
    }
}
