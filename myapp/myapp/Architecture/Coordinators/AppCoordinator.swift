//
//  AppCoordinator.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 14/04/22.
//

import UIKit
class AppCoordinator : Coordinator {
   
    //MARK: IBOutlet
    var navController : UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let navVC = navController {
        let firstVCCoordinator = MainCoordinator(navVC)
            firstVCCoordinator.start()
        }
    }
    
    func finish() {
    }
    
    func finishToRoot() {
        
    }
    
    
}
