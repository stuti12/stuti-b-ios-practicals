//
//  MVPCoordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import Foundation
import UIKit
class MVPCoordinator: Coordinator {
    var navController: UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let firstVC = UIStoryboard(name: "MVP", bundle: nil).instantiateViewController(withIdentifier: "MVPViewController") as? MVPViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
   
    func finish() {
        navController?.popViewController(animated: true)
    }
    func finishToRoot() {
        
    }
    func goTOsecond() {
        if let firstVC = UIStoryboard(name: "MVP", bundle: nil).instantiateViewController(withIdentifier: "MVPViewController") as? MVPViewController {
            navController?.pushViewController(firstVC, animated: true)
        }
    }

}
