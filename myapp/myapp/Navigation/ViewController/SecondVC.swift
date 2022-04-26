
import UIKit
protocol PassDataToVCDelegate {
    func passData(str : String)
}
class SecondVC: UIViewController {
    
    //MARK: IBOutlet
    var data = ""
    var delegate : PassDataToVCDelegate!
    var coordinator : SecondVCCoordinator?
    
    @IBOutlet weak var tfEnterData: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEnterData.text = data
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: IBActions
    @IBAction func btnGoTo3VC(_ sender: UIButton) {
        delegate?.passData(str: tfEnterData.text ?? "No Data")
        navigationController?.popViewController(animated: true)
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func barButtonGoto3(_ sender: Any) {
        update()
    }
    
    @IBAction func btnGoBack(_ sender: UIButton) {
        coordinator?.navController?.popToViewController(self, animated: true)
        coordinator?.goTOFirstVC(strName: tfEnterData.text ?? "no data")
    }
    @IBAction func btnPush4(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: Constants.forthvc) as? ForthVC{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: Extention
extension SecondVC {
    func update() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier:Constants.thirdvc ) as? GoTo3VC {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}
extension SecondVC: PassDataToVCDelegate {
    func passData(str: String) {
        tfEnterData.text = str
    }
}
