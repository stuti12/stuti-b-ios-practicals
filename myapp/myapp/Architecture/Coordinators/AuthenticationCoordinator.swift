//
//  AuthenticationCoordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import Foundation
import UIKit
class AuthenticationCoordinator: Coordinator {
    var navController: UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        
        if let firstVC = UIStoryboard(name: Constants.storymvvm, bundle: nil).instantiateViewController(withIdentifier: Constants.mvvm) as? MVVMViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
    
    func goTOSecondVC(strName: String) {
        
        if let navController = navController {
            
            if let firstVC = UIStoryboard(name: Constants.storymvvm, bundle: nil).instantiateViewController(withIdentifier: Constants.second) as? SecondViewController {
                firstVC.data = strName
                navController.pushViewController(firstVC, animated: true)
            }
        }
    }
    func finish() {
        navController?.popViewController(animated: true)
    }
    func finishToRoot() {
        
    }
}
