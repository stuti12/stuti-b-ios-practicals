
import UIKit

class UIWidgetMainViewController: UIViewController {
     //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.UIWidgetViewController {
            guard segue.destination is UIWidgetViewController else { return }
        }
        if segue.identifier == Constants.TabBarViewController {
            guard segue.destination is TabsViewController else { return }
        }
        
        if segue.identifier == Constants.Practical3ViewController {
            guard segue.destination is Practical3ViewController else {
                return
            }
        }
    }
    
    //MARK: - IBActions
    
    @IBAction func btnTabViewVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.TabBarViewController, sender: self)
    }
    
    @IBAction func goToCollectionVC(_ sender: UIButton) {
        performSegue(withIdentifier: Constants.CollectionController, sender: self)
    }
    
}
