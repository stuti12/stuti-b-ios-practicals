//
//  HomeViewController.swift
//  myapp
//
//  Created by Stuti Bhavsar  on 03/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var fruitTableView: UITableView!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var searchItem: UISearchBar!
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    var searching = false
    var fruitList = [FruitData]()
    var searchList = [FruitData]()
    var imageView = UIImageView()
    var size : CGFloat = 1
    var cName: String = ""
       var cImage: String = ""
       
    //MARK: Life cycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fruitTableView.delegate = self
        searchItem.delegate = self
        fillData()
    }
    
    //MARK: IBActions
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == Constants.zero {
            self.fruitCollectionView.alpha = CGFloat(Constants.one)
            self.fruitTableView.alpha = CGFloat(Constants.zero)
        }
        else {
            self.fruitCollectionView.alpha = CGFloat(Constants.zero)
            self.fruitTableView.alpha = CGFloat(Constants.one)
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        imageView.frame = CGRect(x: Constants.zero, y: Constants.zero, width: Int(size*CGFloat(value)), height: Int(size*CGFloat(value)))
        imageView.center = view.center
        if sender.value > 0 {
            fruitCollectionView.isHidden = true
            fruitTableView.isHidden = true
        } else {
            fruitCollectionView.isHidden = false
            fruitTableView.isHidden = false
        }
    }
    
    
    //MARK: Extra Function
    private func fillData() {
        fruitTableView.register(UINib(nibName: Constants.fruitTableCell, bundle: nil),forCellReuseIdentifier:Constants.tableCell)
        imageView.backgroundColor = UIColor.red
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.image = UIImage(named: "apple")
        self.view.addSubview(imageView)
        
        fruitCollectionView.refreshControl = UIRefreshControl()
        fruitCollectionView.refreshControl?.addTarget(self, action: #selector(pullIt), for: .valueChanged)
        fruitTableView.refreshControl = UIRefreshControl()
        fruitTableView.refreshControl?.addTarget(self, action: #selector(pullIt), for: .valueChanged)
        
        let fruit1 = FruitData(fruitname: "apple", fruitsImage: "apple")
        fruitList.append(fruit1)
        
        let fruit2 = FruitData(fruitname: "banana", fruitsImage: "bananas")
        fruitList.append(fruit2)
        let fruit3 = FruitData(fruitname: "strawberry", fruitsImage: "strawberry")
        fruitList.append(fruit3)
        fruitList.append(fruit1)
        fruitList.append(fruit2)
        fruitList.append(fruit3)
        fruitList.append(fruit1)
        fruitList.append(fruit2)
        fruitList.append(fruit1)
        fruitList.append(fruit2)
        
        self.fruitCollectionView.bounces = false
        self.fruitTableView.bounces = false
    }
    @objc func pullIt() {
        self.fruitTableView.reloadData()
        self.fruitCollectionView.reloadData()
        fruitTableView.refreshControl?.endRefreshing()
        fruitCollectionView.refreshControl?.endRefreshing()
    }
}

//MARK: Extention for Collectionview Datasource and Delegate
extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching == true
        {
            return searchList.count
        }
        else {
            return fruitList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fruitCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionCell, for: indexPath) as! MyCollectionViewCell
        if searching {
            cell.myImage.image = UIImage(named: searchList[indexPath.row].fruitImage)
            cell.labelName.text = searchList[indexPath.row].fruitName
        }
        else {
            cell.myImage.image = UIImage(named: fruitList[indexPath.row].fruitImage)
            cell.labelName.text = fruitList[indexPath.row].fruitName
        }
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = CGFloat(Constants.two)
        return cell
    }
    
}
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                cName = fruitList[indexPath.row].fruitName
                cImage = fruitList[indexPath.row].fruitImage
                performSegue(withIdentifier: Constants.switchStack, sender: self)
    }
}
//MARK: Extention for SearchBar
extension HomeViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        searchList = searchText.isEmpty ? fruitList : fruitList.filter { (fruit: FruitData) in
            fruit.fruitName.lowercased().contains(searchText.lowercased())
        }
        self.fruitCollectionView.reloadData()
        self.fruitTableView.reloadData()
    }
    
}

//MARK: Extention for TableViewDelegate

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchList.count
        }
        else {
            return fruitList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyTableViewCell = (tableView.dequeueReusableCell(
            withIdentifier: Constants.tableCell) as? MyTableViewCell) else {
                return UITableViewCell()
                
            }
        if searching {
            cell.labelName.text = searchList[indexPath.row].fruitName
            cell.myImage.image = UIImage(named: searchList[indexPath.row].fruitImage)
        }
        else {
            cell.myImage.image = UIImage(named: fruitList[indexPath.row].fruitImage)
            cell.labelName.text = fruitList[indexPath.row].fruitName
        }
        return cell
        
    }
}
extension HomeViewController: UITableViewDelegate {
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             cName = fruitList[indexPath.row].fruitName
             cImage = fruitList[indexPath.row].fruitImage
             performSegue(withIdentifier: Constants.switchStack, sender: self)
        }
}
