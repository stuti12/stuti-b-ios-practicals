//
//  Practical3ViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 03/03/22.
//

import UIKit

class Practical3ViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet weak var demoCollectionView: UICollectionView!
    var arrName = [Constants.arr1,Constants.arr2,Constants.arr3]
    var refreshData : UIRefreshControl!
   
    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshData = UIRefreshControl()
        self.refreshData.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.demoCollectionView.addSubview(refreshData)
        self.demoCollectionView.alwaysBounceVertical = true
        self.demoCollectionView.bounces = true
    }
    
    @objc func loadData() {
        print(Constants.printdata)
    }
    //MARK: IBActions
    
    @IBAction func stepperValuceChange(_ sender: UIStepper) {
    }
}

//MARK: Extention-Delegate,Datasource
extension Practical3ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.demoCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cell, for: indexPath) as! DemoCollectionViewCell
        cell.lblName.text = arrName[indexPath.row]
        return cell
    }
}
extension Practical3ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
extension Practical3ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Int(collectionView.bounds.size.width)/Constants.two - Constants.twenty, height: Constants.twenty)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.eight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.two)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: CGFloat(Constants.twenty), left: CGFloat(Constants.twenty), bottom: CGFloat(Constants.twenty), right: CGFloat(Constants.twenty))
    }

}
