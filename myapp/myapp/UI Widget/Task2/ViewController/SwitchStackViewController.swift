
import UIKit

class SwitchStackViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switch1: UISwitch!
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBActions
    @IBAction func switchValueChange(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "First switch is turned on"
            print("horizontal \(stackView.axis)")
            stackView.axis = .horizontal
        }
        else {
            label.text = "First switch is turned off"
            print("vertical \(stackView.axis)")
            stackView.axis = .vertical
        }
    }
}
