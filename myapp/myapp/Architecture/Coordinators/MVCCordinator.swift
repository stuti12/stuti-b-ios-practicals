//
//  MVCCordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import Foundation
import UIKit
class MVCCoordinator: Coordinator {
    var navController: UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let firstVC = UIStoryboard(name: "MVCViewTraffic", bundle: nil).instantiateViewController(withIdentifier: "ArchitectureViewController") as? ArchitectureViewController {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
    func goTOsecond() {
        if let firstVC = UIStoryboard(name: "MVCViewTraffic", bundle: nil).instantiateViewController(withIdentifier: "MVCViewController") as? MVCViewController {
            navController?.pushViewController(firstVC, animated: true)
        }
    }
   
    func goToMVP() {
        if let navVC = navController {
        let firstVCCoordinator = MVPCoordinator(navVC)
            firstVCCoordinator.start()
        }
    }
    
    func goToMVVM() {
        if let navVC = navController {
        let firstVCCoordinator = AuthenticationCoordinator(navVC)
            firstVCCoordinator.start()
        }
    }
    func finish() {
        navController?.popViewController(animated: true)
    }
    func finishToRoot() {
        
    }
}
