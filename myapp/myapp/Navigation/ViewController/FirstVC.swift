
import UIKit

class FirstVC: UIViewController {
    
 //MARK: IBOutlets
    @IBOutlet weak var tfEnterData: UITextField!
    var message : String = ""
    var coordinator : FirstVCCoordinator?
   
  //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEnterData.text = message
      
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // guard var second : GoTo2VC = segue.destination as? GoTo2VC else {return}
       // second.data = tfEnterData.text ?? "No data"
    }*/
    
//MARK: IBActions
    @IBAction func btnSend(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: Constants.secondvc) as? SecondVC {
            vc.data = tfEnterData.text ?? "No Data"
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }
    
    @IBAction func btnsendData(_ sender: UIButton) {
        coordinator?.goTOSecondVC(strName: tfEnterData.text ?? "No Data")
    }
    @IBAction func barButton(_ sender: UIBarButtonItem) {
        coordinator?.goTOSecondVC(strName: tfEnterData.text ?? "No Data")
    }
}

//MARK: Extentions
extension FirstVC : PassDataToVCDelegate {
    func passData(str: String) {
        tfEnterData.text = str
    }
    
    func update() {
       
        if let forthVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.secondvc) as? SecondVC {
            self.navigationController?.pushViewController(forthVC, animated: true)
        }
        
    }
   
}

