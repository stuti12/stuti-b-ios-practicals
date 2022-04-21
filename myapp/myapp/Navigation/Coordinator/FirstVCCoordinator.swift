
import Foundation
import UIKit
class FirstVCCoordinator: Coordinator {
    var navController: UINavigationController?
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let firstVC = UIStoryboard(name: Constants.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.firstvc) as? FirstVC {
            firstVC.coordinator = self
            navController?.pushViewController(firstVC, animated: true)
        }
    }
   
    func goTOSecondVC(strName: String) {
       
        if let navController = navController {
            let secondVCCOordinate = SecondVCCoordinator(navController)
            
            if let firstVC = UIStoryboard(name: Constants.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.secondvc) as? SecondVC {
                firstVC.coordinator = secondVCCOordinate
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
//MARK: Extention

