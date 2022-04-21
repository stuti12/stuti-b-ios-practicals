
import Foundation
import UIKit
protocol PassDataToVCCoordinatorDelegate {
    func passData(strName : String)
}
class SecondVCCoordinator: Coordinator {
    
    //MARK: Variables IBOutlets
    var navController: UINavigationController?
    var delegate : PassDataToVCCoordinatorDelegate!
    
    init(_ navigationController : UINavigationController){
        navController = navigationController
    }
    func start() {
        if let secondVC = UIStoryboard(name: Constants.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.secondvc) as? SecondVC {
            secondVC.coordinator = self
            navController?.pushViewController(secondVC, animated: true)
    }
    }
    
    func goTOFirstVC(strName: String) {
        if let navController = navController {
            let firstVCCOordinate = FirstVCCoordinator(navController)
            
            if let firstVC = UIStoryboard(name: Constants.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.firstvc) as? FirstVC {
                firstVC.coordinator = firstVCCOordinate
                firstVC.message = strName
                navController.pushViewController(firstVC, animated: true)
            }

        }
       /* if let secondVC = UIStoryboard(name: "NavigationControl", bundle: nil).instantiateViewController(withIdentifier: "firstVC") as? FirstVC {
           // secondVC.message = strName
            delegate?.passData(str: secondVC.tfEnterData.text ?? "no data")
            navController?.pushViewController(secondVC, animated: true)
        }*/
    }
    func finish() {
        navController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        
    }
}
