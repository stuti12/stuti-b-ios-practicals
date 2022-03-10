
import UIKit

class GoTo3VC: UIViewController {
    //MARK: IBOutlet
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: IBActions
    @IBAction func barbtnGoto1(_ sender: UIBarButtonItem) {
        //  self.navigationController?.popToRootViewController(animated: true)
        if self.presentingViewController != nil {
            self.dismiss(animated: false, completion: {
                self.navigationController!.popToRootViewController(animated: true)
            })
        }
        else {
            self.navigationController!.popToRootViewController(animated: true)
        }
    }
}

//MARK: Extentions
extension GoTo3VC {
    func update() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier:"FirstVC" ) as? FirstVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
