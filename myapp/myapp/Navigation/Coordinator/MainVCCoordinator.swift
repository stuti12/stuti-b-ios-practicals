//
//  MainVCCoordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 15/04/22.
//

import Foundation
import UIKit
class MainCoordinator : Coordinator {
    var navController : UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let firstVC = UIStoryboard(name: Constants.main, bundle: nil).instantiateViewController(withIdentifier: Constants.viewController) as? ViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
    func openFirstVC() {
           if let navVC = navController {
           let firstVCCoordinator = FirstVCCoordinator(navVC)
               firstVCCoordinator.start()
           }
       }
    func finish() {
    }
    
    func finishToRoot() {
        
    }
}
