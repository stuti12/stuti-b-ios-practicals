//
//  MainCoordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import Foundation
import UIKit
class MainCoordinator: Coordinator {
    var navController: UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let firstVC = UIStoryboard(name: Constants.storymain, bundle: nil).instantiateViewController(withIdentifier: Constants.viewController) as? ViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
   
   
    func finish() {
        navController?.popViewController(animated: true)
    }
    func finishToRoot() {
    }
    
    func openArch() {
        if let navVC = navController {
        let firstVCCoordinator = MVCCoordinator(navVC)
            firstVCCoordinator.start()
        }
    }
    
    func openFirstVC() {
           if let navVC = navController {
           let firstVCCoordinator = FirstVCCoordinator(navVC)
               firstVCCoordinator.start()
           }
       }
    func openMVP() {
        if let navVC = navController {
        let firstVCCoordinator = MVPCoordinator(navVC)
            firstVCCoordinator.start()
        }
    }
}

