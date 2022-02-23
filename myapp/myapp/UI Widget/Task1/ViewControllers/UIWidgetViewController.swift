//
//  UIWidgetViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 28/02/22.
//

import UIKit

class UIWidgetViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tfPswd: UITextField!
  
    @IBOutlet weak var slideAge: UISlider!
    @IBOutlet weak var tvBio: UITextView!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var rbmale: UIButton!
    @IBOutlet weak var rbfemale: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    //MARK: - IBActions
    @IBAction func onValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        lblAge.text = "Your Age is "+Int(sender.value).description
    }
    
    @IBAction func btnMale(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.tag == 1 {
            rbmale.isSelected = true
            rbfemale.isSelected = false
        }
    }
    
    @IBAction func rbfemale(_ sender: UIButton) {
        if sender.tag == 2 {
            rbfemale.isSelected = true
            rbmale.isSelected = false
        }
    }
    
    @IBAction func onSubmitClick(_ sender: UIButton) {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.center = view.center
        progressView.setProgress(5, animated: true)
        progressView.trackTintColor = UIColor.lightGray
        progressView.tintColor = UIColor.blue
        view.addSubview(progressView)
    }
    
    @IBAction func changePage(_ sender: UIPageControl) {
        switch sender.currentPage {
            
        case 0:
            sender.backgroundColor = UIColor.black
        case 1:
            sender.backgroundColor = UIColor.gray
        default:
            sender.backgroundColor = UIColor.brown
        }
    }
    
    //MARK: Extra Functions
    func setData() {
        tfEmail.text="enter email"
        tfPswd.text = "Enter password"
        tvBio.text = "Bio"
        tvBio.layer.cornerRadius = 4
        tvBio!.layer.borderWidth = 3
        slideAge.minimumValue = 0
        slideAge.maximumValue = 60
        
    }
    
}
